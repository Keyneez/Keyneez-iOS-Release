//
//  OAuthAPI.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/28/23.
//

import Foundation
import Moya

enum LoginType: String {
  case KAKAO
  case APPLE
}

enum OAuthAPI {
  case signIn(idToken: String, type: LoginType)
  case signUp(param: KakaoSignUpRequestDTO)
}

extension OAuthAPI: TargetType {
  
  var baseURL: URL {
    return URL(string: APIEnvironment.apiURL + "/oauth")!
  }
  
  var path: String {
    switch self {
    case .signIn:
      return "/sign-in"
    case .signUp:
      return "/sign-up"
    }
  }
  
  var method: Moya.Method {
    .post
  }
  
  var task: Moya.Task {
    switch self {
    case .signIn(let id_token, let type):
      return .requestParameters(parameters: ["id_token": id_token, "oauth_type": type.rawValue], encoding: JSONEncoding.default)
    case .signUp(let dto):
      return .requestParameters(parameters: try! dto.asParameter(), encoding: JSONEncoding.default)
    }
  }
  
  var headers: [String : String]? {
    return ["Content-Type": "application/json"]
  }
  
  var validationType: ValidationType {
    return .successCodes
  }
  
  
}
