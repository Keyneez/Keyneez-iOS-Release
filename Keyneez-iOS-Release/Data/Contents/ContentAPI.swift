//
//  ContentAPI.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/16.
//

import Foundation
import Moya

enum ContentAPI {
  case getAllContents(token: String, filter: String?)
  case getSearchContent(token: String, keyword: String)
  case getRecommendContent(token: String)
  case getPopularityContent(token: String, filter: String?)
  case getDetailContent(token: String, pk: Int)
  case getLikeContent(token: String, filter: String?)
  case postLikeContent(token: String, pk: Int)
  case postUnlikeContent(token: String, pk: [Int])
}

extension ContentAPI: TargetType {
  var baseURL: URL {
    return URL(string: APIEnvironment.apiURL + "contents")!
  }

  var path: String {
    switch self {
    case .getAllContents:
      return ""
    case .getSearchContent:
      return "/search"
    case .getRecommendContent:
      return "/recommend"
    case .getPopularityContent:
      return "/popularity"
    case .getDetailContent(_, let pk):
      return "/\(pk)"
    case .getLikeContent :
      return "/liked"
    case .postLikeContent(_, let pk):
      return "/\(pk)/like"
    case .postUnlikeContent(_, let pk):
        let pkString = pk.map { String($0) }.joined(separator: ",")
        return "/\(pkString)/unlike"
    }
  }

  var method: Moya.Method {
    switch self {
    case .getAllContents,
        .getSearchContent,
        .getRecommendContent,
        .getPopularityContent,
        .getDetailContent,
        .getLikeContent :
      return .get
    case .postLikeContent,
        .postUnlikeContent :
      return .post
    }
  }

  var task: Moya.Task {
    switch self {
    case .getAllContents(_, let filter),
        .getPopularityContent(_, let filter),
        .getLikeContent(_, let filter):
      return .requestParameters(parameters: ["filter": filter ?? ""], encoding: URLEncoding.queryString)
    case .getRecommendContent :
      return .requestPlain
    case .getSearchContent(_, let keyword):
      return .requestParameters(parameters: ["keyword": keyword], encoding: URLEncoding.queryString)
    case .getDetailContent(_, let pk),
        .postLikeContent(_, let pk) :
      return .requestParameters(parameters: ["pk": pk], encoding: JSONEncoding.default)
    case .postUnlikeContent(_, let pk):
        let pkString = pk.map { String($0) }.joined(separator: ",")
        return .requestParameters(parameters: ["pk": pkString], encoding: URLEncoding.queryString)

    }
  }

  var headers: [String : String]? {
    switch self {
    case .getAllContents(let token, _),
        .getSearchContent(let token, _),
        .getRecommendContent(let token),
        .getPopularityContent(let token, _),
        .getDetailContent(let token, _),
        .getLikeContent(let token, _),
        .postLikeContent(let token, _),
        .postUnlikeContent(let token, _):
      return ["Content-Type": "application/json", "Authorization": "Bearer \(token)"]
    }
  }
}
