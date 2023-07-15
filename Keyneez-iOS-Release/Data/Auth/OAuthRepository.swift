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
      return self.tokenError
    }
  }
}

protocol OAuthRepositoryProtocol {
  func loginWithKakao() async throws -> (dto: KakaoLoginResponseDTO, idToken: String, accessToken: String)
  func signUpWithKakao(with dto: KakaoSignUpRequestDTO) async throws -> KakaoLoginResponseDTO
}

final class OAuthRepository: OAuthRepositoryProtocol {
  
  private var OauthRemoteManager = OAuthRemoteManager.shared
  
  func signUpWithKakao(with dto: KakaoSignUpRequestDTO) async throws -> KakaoLoginResponseDTO {
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
  
  func loginWithKakao() async throws -> (dto: KakaoLoginResponseDTO, idToken: String, accessToken: String) {
    if KakaoUserApi.isKakaoTalkLoginAvailable() {
      guard let info = await KakaoUserApi.shared.loginWithKakaoTalk().0 else {
        throw WelcomeViewModelError.kakaoLoginNotAvailable
      }
      guard let idToken = info.idToken else {
        throw WelcomeViewModelError.kakaoLoginNotAvailable
      }
      
      return (try await OAuthRemoteManager.shared.kakaoLogin(idToken: idToken), idToken, info.accessToken)
    }
    
    guard let info = await KakaoUserApi.shared.loginWithKakaoAccount().0 else {
      throw WelcomeViewModelError.kakaoLoginNotAvailable
    }
    guard let idToken = info.idToken else {
      throw WelcomeViewModelError.kakaoLoginNotAvailable
    }
    
    return (try await OAuthRemoteManager.shared.kakaoLogin(idToken: idToken), idToken, info.accessToken)
  }
  
}
