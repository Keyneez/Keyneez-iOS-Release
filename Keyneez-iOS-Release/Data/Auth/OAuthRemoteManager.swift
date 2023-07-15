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
  
  func kakaoLogin(idToken: String) async throws -> KakaoLoginResponseDTO {
    
    let target = OAuthAPI.kakao(idToken: idToken)
    return try await requestFrom(target, modelType: KakaoLoginResponseDTO.self)
  }
  
  func kakaoSignUp(with dto: KakaoSignUpRequestDTO) async throws -> KakaoLoginResponseDTO {
    let target = OAuthAPI.kakaoSignup(param: dto)
    return try await requestFrom(target, modelType: KakaoLoginResponseDTO.self)
  }
  
}
