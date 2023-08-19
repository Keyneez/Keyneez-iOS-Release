//
//  ContentRemoteManager.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/18.
//

import Foundation
import Moya

final class ContentRemoteManager: RequestSendable {
  
  static let shared: ContentRemoteManager = .init()
  
  private init() { }
  
  var decoder: ResponseDecodable = Decoder()
  
  var provider: MoyaProvider<ContentAPI> = .init(plugins: [NetworkLoggerPlugin(verbose: true)])
  
  func getAllContent(token: String, filter: String?) async throws -> DetailContentResponseDTO {
    let target = ContentAPI.getAllContents(token: token, filter: filter)
    return try await requestFrom(target, modelType: DetailContentResponseDTO.self)
  }
  
  func getSearchContent(token: String, keyword: String) async throws -> DetailContentResponseDTO {
    let target = ContentAPI.getSearchContent(token: token, keyword: keyword)
    return try await requestFrom(target, modelType: DetailContentResponseDTO.self)
  }
  
  func getRecommendContent(token: String, keyword: String) async throws -> DetailContentResponseDTO {
    let target = ContentAPI.getRecommendContent(token: token, keyword: keyword)
    return try await requestFrom(target, modelType: DetailContentResponseDTO.self)
  }
  
  func getPopularityContent(token: String, filter: String?) async throws -> DetailContentResponseDTO {
    let target = ContentAPI.getPopularityContent(token: token, filter: filter)
    return try await requestFrom(target, modelType: DetailContentResponseDTO.self)
  }
  
  func getDetailContent(token: String, pk: Int) async throws -> DetailContentResponseDTO {
    let target = ContentAPI.getDetailContent(token: token, pk: pk)
    return try await requestFrom(target, modelType: DetailContentResponseDTO.self)
  }
  
  func getLikeContent(token: String, filter: String?) async throws -> ContentsLikedResponseDTO {
    let target = ContentAPI.getLikeContent(token: token, filter: filter)
    return try await requestFrom(target, modelType: ContentsLikedResponseDTO.self)
  }
  
  func postLikeContent(token: String, pk: Int) async throws -> ContentsLikedResponseDTO {
    let target = ContentAPI.postLikeContent(token: token, pk: pk)
    return try await requestFrom(target, modelType: ContentsLikedResponseDTO.self)
  }
  
  func postUnlikeContent(token: String, pk: [Int]) async throws -> UnlikeResponseDTO {
    let target = ContentAPI.postUnlikeContent(token: token, pk: pk)
    return try await requestFrom(target, modelType: UnlikeResponseDTO.self)
  }
  
}
