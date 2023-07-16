//
//  NetworkErrorl.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/29/23.
//

import Foundation

enum KeyneezNetworkError: LocalizedError {
  case DecodeError
  case failure(statusCode: Int, message: String)
  
  var errorDescription: String? {
    switch self {
    case .DecodeError:
      return "디코딩 Error, ResDTO 살펴보기"
    case .failure(let statusCode, let message):
      return "ERROR: \(statusCode) - \(message)"
    }
  }
}
