//
//  AuthInterceptor.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/29/23.
//

import Foundation
import Moya
import Alamofire

enum AuthError: LocalizedError {
  case needToken
  case wrontRefreshToken
  
  var errorDescription: String? {
    switch self {
    case .needToken:
      return "token이 필요합니다."
    case .wrontRefreshToken:
      return "RefreshToken이 잘못되었습니다."
    }
  }
}

final class AuthInterceptor: RequestInterceptor {
  
  static let shared = AuthInterceptor()
  private init() { }
  
  func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
    guard urlRequest.url?.absoluteString.hasPrefix(APIEnvironment.apiURL) == true, let accessToken = UserManager.shared.accessToken, let _ = UserManager.shared.refreshToken else {
      completion(.success(urlRequest))
      return
    }
    
    var urlRequest = urlRequest
    urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
    completion(.success(urlRequest))
    
  }
  
  func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
    guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
      completion(.doNotRetryWithError(error))
      return
    }
    
    AuthRemoteManager.shared.refresh { response in
      if let accessToken = response.accessToken {
        completion(.retry)
      } else {
        // 갱신 실패
        // gotoLogin
        completion(.doNotRetryWithError(AuthError.wrontRefreshToken))
      }
    }

  }
  
}
