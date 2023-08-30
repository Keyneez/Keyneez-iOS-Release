//
//  AuthRemoteManager.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/29/23.
//

import Foundation
import Moya

final class AuthRemoteManager: RequestSendable {
  
  static let shared: AuthRemoteManager = .init()
  private init() { }
  var decoder: ResponseDecodable = Decoder()
  var provider: Moya.MoyaProvider<AuthAPI> = .init()
  
  func refresh(accessToken: String, refreshToken: String) async throws -> RefreshResponseDTO {
    let target = AuthAPI.refresh(accessToken: accessToken, refreshToken: refreshToken)
    return try await requestFrom(target, modelType: RefreshResponseDTO.self)
  }
  
  func refresh(completion: @escaping (RefreshResponseDTO) -> Void) {
    
  }
  
  func logout(with accessToken: String) async throws -> LogoutResponseDTO { // DecodeError
    let target = AuthAPI.logout(accessToken: accessToken)
    return try await requestFrom(target, modelType: LogoutResponseDTO.self)
  }
  
  func withdrawWithKakao(accessToken: String) async throws -> WithdrawResponseDTO {
    let target = AuthAPI.withdrawWithKakao(accessToken: accessToken)
    return try await requestFrom(target, modelType: WithdrawResponseDTO.self)
  }
  
}
