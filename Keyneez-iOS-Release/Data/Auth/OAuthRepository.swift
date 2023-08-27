//
//  OAuthRepository.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/29/23.
//

import Foundation

enum OAuthRepositoryError: LocalizedError {
  
  case unknownError
  case alreadyUser
  case tokenError
  
  var errorDescription: String? {
    switch self {
    case .unknownError:
      return "다시 시도해주세요"
    case .tokenError:
      return "다시 로그인 시도해주세요"
    case .alreadyUser:
      return "이미 가입된 유저입니다. 다시 로그인해주세요!"
    }
  }
  
  static func getErrorDesc(by statusCode: Int) -> Self {
    if statusCode == 409 {
      return self.alreadyUser
    } else {
      print("\(statusCode)")
      print("getErrorDesc")
      return self.tokenError
    }
  }
}

protocol OAuthRepositoryProtocol {
  func signInWithKakao() async throws -> LoginResponseDTO
  func signUpWithKakao(with dto: KakaoSignUpRequestDTO) async throws -> LoginResponseDTO
  func signInWithApple() async throws -> LoginResponseDTO
  func signOutWithApple() async throws -> LogoutResponseDTO
  func signOutWithKakao() async throws -> LogoutResponseDTO
}

final class OAuthRepository: OAuthRepositoryProtocol {
  
  private var OauthRemoteManager = OAuthRemoteManager.shared
  private var appleLoginManager = AppleLoginManager.shared
  private var authRemoteManager = AuthRemoteManager.shared
  
  func signInWithApple() async throws -> LoginResponseDTO {
    
    do {
      guard let idToken = await appleLoginManager.performAppleSignIn() else {
        throw OAuthRepositoryError.tokenError
      }
      return try await OauthRemoteManager.appleLogin(with: idToken)
    } catch(let e) {
      if let error = e as? KeyneezNetworkError {
        switch error {
        case .DecodeError:
          throw OAuthRepositoryError.unknownError
        case .failure(let statusCode, _):
          throw OAuthRepositoryError.getErrorDesc(by: statusCode)
        }
      }
      throw OAuthRepositoryError.unknownError
    }
  }
  
  func signUpWithKakao(with dto: KakaoSignUpRequestDTO) async throws -> LoginResponseDTO {
    do {
      return try await OauthRemoteManager.kakaoSignUp(with: dto)

    } catch(let e) {
      if let error = e as? KeyneezNetworkError {
        switch error {
        case .DecodeError:
          throw OAuthRepositoryError.unknownError
        case .failure(let statusCode, _):
          throw OAuthRepositoryError.getErrorDesc(by: statusCode)
        }
      }
      throw OAuthRepositoryError.unknownError
    }
  }
  
  func signInWithKakao() async throws -> LoginResponseDTO {
    if KakaoUserApi.isKakaoTalkLoginAvailable() {
      guard let info = await KakaoUserApi.shared.loginWithKakaoTalk().0, let idToken = info.idToken else {
        throw WelcomeViewModelError.kakaoLoginNotAvailable
      }
      
      return try await OauthRemoteManager.kakaoLogin(idToken: idToken)
  
    }
    
    guard let info = await KakaoUserApi.shared.loginWithKakaoAccount().0, let idToken = info.idToken else {
      throw WelcomeViewModelError.kakaoLoginNotAvailable
    }
    
    return try await OauthRemoteManager.kakaoLogin(idToken: idToken)
  }
  
  func signOutWithApple() async throws -> LogoutResponseDTO {
    do {
      guard let accessToken = UserManager.shared.accessToken else {
        // 여기서 오류..
        throw OAuthRepositoryError.tokenError
      }
      return try await authRemoteManager.logout(accessToken: accessToken)
    } catch(let e) {
      if let error = e as? KeyneezNetworkError {
        switch error {
        case .DecodeError:
          throw OAuthRepositoryError.unknownError
        case .failure(let statusCode, _):
          throw OAuthRepositoryError.getErrorDesc(by: statusCode)
        }
      }
      throw OAuthRepositoryError.unknownError
    }
  }
  
  func signOutWithKakao() async throws -> LogoutResponseDTO {
    let logoutError = await KakaoUserApi.shared.logoutWithKakaoAcount()
    let unlinkError = await KakaoUserApi.shared.unlinkWithKakaoAccount()
    if let logoutError = logoutError, let unlinkError = unlinkError {
        print("카카오 계정 로그아웃 중 에러 발생: \(logoutError.localizedDescription)")
      print("카카오 계정 언링크 중 에러 발생: \(unlinkError.localizedDescription)")
      throw OAuthRepositoryError.unknownError
    } else {
        print("카카오 계정 로그아웃 성공")
      do {
        guard let accessToken = UserManager.shared.accessToken else {
          throw OAuthRepositoryError.tokenError
        }
        return try await authRemoteManager.logout(accessToken: accessToken)
      } catch(let e) {
        print("authRemoteManager logout에서 오류")
        if let error = e as? KeyneezNetworkError {
          switch error {
          case .DecodeError:
            throw OAuthRepositoryError.unknownError
          case .failure(let statusCode, _):
            throw OAuthRepositoryError.getErrorDesc(by: statusCode)
          }
        }
        throw OAuthRepositoryError.unknownError
      }
    }

  }
}
