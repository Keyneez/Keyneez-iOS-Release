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
  
  func refresh() async throws -> String {
    return await ""
  }
  
  func refresh(completion: @escaping (RefreshResponseDTO) -> Void) {
    
  }
  
  func logout() async throws -> LogoutResponseDTO {
    let target = AuthAPI.logout(accessToken: "")
    return try await requestFrom(target, modelType: LogoutResponseDTO.self)
  }
  
}
