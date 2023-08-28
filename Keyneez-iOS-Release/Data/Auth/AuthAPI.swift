//
//  AuthAPI.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/28/23.
//

import Foundation
import Moya

enum AuthAPI {
  case refresh(accessToken: String, refreshToken: String)
  case logout(accessToken: String)
  case withdrawWithKakao(accessToken: String)
}

extension AuthAPI: TargetType {
  
  var baseURL: URL {
    return URL(string: APIEnvironment.apiURL + "/auth")!
  }
  
  var path: String {
    switch self {
    case .refresh:
      return "/refresh"
    case .logout:
      return "/logout"
    case .withdrawWithKakao:
      return "/withdraw/kakao"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .refresh:
      return .post
    case .logout:
      return .get
    case .withdrawWithKakao:
      return .delete
    }
  }
  
  var task: Moya.Task {
    switch self {
    case .refresh(_, let refreshToken):
      return .requestParameters(parameters: ["refresh_token": refreshToken], encoding: JSONEncoding.default)
    case .logout:
      return .requestPlain
    case .withdrawWithKakao:
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .refresh(let accessToken, _), .logout(let accessToken), .withdrawWithKakao(let accessToken):
      return ["Content-Type": "application/json", "Authorization": "Bearer \(accessToken)"]
    }
  }
}
