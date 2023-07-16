//
//  OAuthAPI.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/28/23.
//

import Foundation
import Moya

enum OAuthAPI {
  case kakao(idToken: String)
  case kakaoSignup(param: KakaoSignUpRequestDTO)
}

extension OAuthAPI: TargetType {
  
  var baseURL: URL {
    return URL(string: APIEnvironment.apiURL + "/oauth")!
  }
  
  var path: String {
    switch self {
    case .kakao:
      return "/kakao"
    case .kakaoSignup:
      return "/kakao/sign-up"
    }
  }
  
  var method: Moya.Method {
    .post
  }
  
  var task: Moya.Task {
    switch self {
    case .kakao(let id_token):
      return .requestParameters(parameters: ["id_token": id_token], encoding: JSONEncoding.default)
    case .kakaoSignup(let dto):
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
