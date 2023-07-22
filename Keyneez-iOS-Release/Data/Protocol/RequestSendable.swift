//
//  RequestSendable.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/29/23.
//

import Foundation
import Moya

protocol RequestSendable {
  associatedtype APITargetType: TargetType
  var decoder: ResponseDecodable { get }
  var provider: MoyaProvider<APITargetType> { get }
  func requestFrom<T: Codable>(_ target: APITargetType, modelType: T.Type) async throws -> T
  func process<T: Codable>(type: T.Type, result: Result<Response, MoyaError>) throws -> T?
}

extension RequestSendable {
  
  func requestFrom<T: Codable>(_ target: APITargetType, modelType: T.Type) async throws -> T {
    let result = await provider.request(target)
    guard let dto = try process(type: modelType, result: result) else {
      throw KeyneezNetworkError.DecodeError
    }
    return dto
  }
  
  func process<T: Codable>(type: T.Type, result: Result<Response, MoyaError>) throws -> T? {
    switch result {
    case .success(let response):
      return try? decoder.decode(model: GenericResponse<T>.self, response: response).data
    case .failure(let e):
      guard let failedResponse = e.response else {
        throw KeyneezNetworkError.failure(statusCode: 400, message: "unknown Error")
      }
      let failed = try decoder.decode(model: GenericResponse<T>.self, response: failedResponse)
      throw KeyneezNetworkError.failure(statusCode: failed.status ?? 404, message: failed.message ?? "unknown Error")
    }
  }
  
}
