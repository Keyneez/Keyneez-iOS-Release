//
//  ContentRemoteManager.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/18.
//

import Foundation
import Moya

enum DecodeError: Error {
    case decodeError
    case decodingFailed(error: Error)
}

final class ContentAPIProvider {
  
  static let shared: ContentAPIProvider = .init()
  let contentProvider = MoyaProvider<ContentAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
  var decoder: ResponseDecodable = Decoder()
  
  func getAllContent(token: String, filter: String?, completion: @escaping (Result<[DetailContentResponseDTO]?, Error>) -> Void) {
    let target = ContentAPI.getAllContents(token: token, filter: filter)
    requestFrom(target, modelType: [DetailContentResponseDTO].self, completion: completion)
  }
  
  func getSearchContent(token: String, keyword: String, completion: @escaping (Result<[DetailContentResponseDTO]?, Error>) -> Void) {
    let target = ContentAPI.getSearchContent(token: token, keyword: keyword)
    requestFrom(target, modelType: [DetailContentResponseDTO].self, completion: completion)
  }
  
  func getRecommendContent(token: String, completion: @escaping (Result<[DetailContentResponseDTO]?, Error>) -> Void) {
    let target = ContentAPI.getRecommendContent(token: token)
    requestFrom(target, modelType: [DetailContentResponseDTO].self, completion: completion)
  }
  
  func getPopularityContent(token: String, filter: String?, completion: @escaping (Result<[DetailContentResponseDTO]?, Error>) -> Void) {
    let target = ContentAPI.getPopularityContent(token: token, filter: filter)
    requestFrom(target, modelType: [DetailContentResponseDTO].self, completion: completion)
  }
  
  func getDetailContent(token: String, pk: Int, completion: @escaping (Result<DetailContentResponseDTO?, Error>) -> Void) {
    let target = ContentAPI.getDetailContent(token: token, pk: pk)
    requestFrom(target, modelType: DetailContentResponseDTO.self, completion: completion)
  }
  
  func getLikeContent(token: String, filter: String?, completion: @escaping (Result<[ContentsLikedResponseDTO]?, Error>) -> Void) {
    let target = ContentAPI.getLikeContent(token: token, filter: filter)
    requestFrom(target, modelType: [ContentsLikedResponseDTO].self, completion: completion)
  }
  
  func postLikeContent(token: String, pk: Int, completion: @escaping (Result<ContentsLikedResponseDTO?, Error>) -> Void) {
    let target = ContentAPI.postLikeContent(token: token, pk: pk)
    requestFrom(target, modelType: ContentsLikedResponseDTO.self, completion: completion)
  }
  
  func postUnlikeContent(token: String, pk: [Int], completion: @escaping (Result<UnlikeResponseDTO?, Error>) -> Void) {
    let target = ContentAPI.postUnlikeContent(token: token, pk: pk)
    requestFrom(target, modelType: UnlikeResponseDTO.self, completion: completion)
  }
  
}


extension ContentAPIProvider {
  func requestFrom<T: Codable>(_ target: ContentAPI, modelType: T.Type, completion: @escaping (Result<T?, Error>) -> Void) {
    contentProvider.request(target) { result in
      self.process(type: modelType, result: result, completion: completion)
    }
  }
  
  func process<T: Codable>(
    type: T.Type,
    result: Result<Response, MoyaError>,
    completion: @escaping (Result<T?, Error>) -> Void
  ) {
    switch result {
    case .success(let response):
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy.MM.dd"
      decoder.dateDecodingStrategy = .formatted(dateFormatter)
      do {
          let data = try decoder.decode(GenericResponse<T>.self, from: response.data)
          guard let body = data.data else {
              print("ContentAPI: No data in response")
              completion(.failure(DecodeError.decodeError))
              return
          }
          completion(.success(body))
      } catch let decodingError {
          print("ContentAPI: Decoding error: \(decodingError)")
          completion(.failure(DecodeError.decodingFailed(error: decodingError)))
      }
    case .failure(let error):
      completion(.failure(error))
    }
  }
}

