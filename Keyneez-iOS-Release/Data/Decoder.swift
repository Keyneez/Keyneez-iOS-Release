//
//  File.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/29/23.
//

import Foundation
import Moya

protocol ResponseDecodable {
  func decode<T: Codable>(model: T.Type, response: Response) throws -> T
}

final class Decoder: ResponseDecodable {
  
  func decode<T: Codable>(model: T.Type, response: Response) throws -> T {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    if let data = try? decoder.decode(T.self, from: response.data) {
      return data
    } else {
      throw KeyneezNetworkError.DecodeError
    }
  }
  
}
