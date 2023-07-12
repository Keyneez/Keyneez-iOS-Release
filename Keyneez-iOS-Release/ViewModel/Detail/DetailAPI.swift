//
//  DetailAPI.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/07/12.
//

import SwiftUI
import Moya

// TODO: - contentAPI에 합치면 될듯?? 폴더링 다시~
enum DetailAPI {
    case getDetailContents(accessToken: String, contentId: Int)
}

extension DetailAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://dev.keyneez.xyz/api/" + "contents")!
        // TODO: APIEnvironment.apiURL + "contents" 로 변경
    }
    
    var path: String {
        switch self {
        case .getDetailContents(_, let contentId):
            return "/\(contentId)"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getDetailContents(_, let pk):
            return .requestParameters(parameters: ["pk": pk], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getDetailContents(let token, _):
          return ["Content-Type": "application/json", "Authorization": token]
        default:
          return nil
        }
    }
}
