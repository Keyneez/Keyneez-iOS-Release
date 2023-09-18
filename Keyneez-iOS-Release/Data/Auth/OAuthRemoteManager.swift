//
//  OAuthRemoteManager.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/29/23.
//

import Foundation
import Moya

final class OAuthRemoteManager: RequestSendable {
  
  static let shared: OAuthRemoteManager = .init()
  
  private init() { }
  
  var decoder: ResponseDecodable = Decoder()
  
  var provider: MoyaProvider<OAuthAPI> = .init(plugins: [NetworkLoggerPlugin(verbose: true)])
  
  func kakaoLogin(idToken: String) async throws -> LoginResponseDTO {
    
    let target = OAuthAPI.signIn(idToken: idToken, type: .KAKAO)
    
    return try await requestFrom(target, modelType: LoginResponseDTO.self)
  }
  
  func user(accessToken: String) async throws -> UserDTO {
    let target = OAuthAPI.user(accessToken: accessToken)
    return try await requestFrom(target, modelType: UserDTO.self)
  }
  
  func kakaoSignUp(with dto: KakaoSignUpRequestDTO) async throws -> LoginResponseDTO {
    let target = OAuthAPI.signUp(param: dto)
    return try await requestFrom(target, modelType: LoginResponseDTO.self)
  }
  
  func appleLogin(with idToken: String) async throws -> LoginResponseDTO {
    let target = OAuthAPI.signIn(idToken: idToken, type: .APPLE)
    return try await requestFrom(target, modelType: LoginResponseDTO.self)
  }
  
}
