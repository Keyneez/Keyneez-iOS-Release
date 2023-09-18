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
  case user(accessToken: String)
}

extension OAuthAPI: TargetType {
  
  var baseURL: URL {
    switch self {
    case .signIn(let idToken, let type):
      return URL(string: APIEnvironment.apiURL + "/oauth")!
    case .signUp(let param):
      return URL(string: APIEnvironment.apiURL + "/oauth")!
    case .user(let accessToken):
      return URL(string: APIEnvironment.apiURL)!
    }
    
  }
  
  var path: String {
    switch self {
    case .signIn:
      return "/sign-in"
    case .signUp:
      return "/sign-up"
    case .user:
      return "/user"
    }
  }
  
  var method: Moya.Method {
    
    switch self {
    case .signIn(let idToken, let type):
      return .post
    case .signUp(let param):
        return .post
    case .user(let accessToken):
      return .get
    }
  }
  
  var task: Moya.Task {
    switch self {
    case .signIn(let id_token, let type):
      return .requestParameters(parameters: ["id_token": id_token, "oauth_type": type.rawValue], encoding: JSONEncoding.default)
    case .signUp(let dto):
      return .requestParameters(parameters: try! dto.asParameter(), encoding: JSONEncoding.default)
    case .user:
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .signIn, .signUp:
      return ["Content-Type": "application/json"]
    case .user(let accessToken):
      return ["Content-Type": "application/json", "Authorization": "Bearer \(accessToken)"]
    }
  }
  
  var validationType: ValidationType {
    return .successCodes
  }
  
  
}
