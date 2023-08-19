//
//  ContentRepository.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/20.
//

import Foundation

protocol ContentRepositoryProtocol {
  func getAllContents(token: String, filter: String?, completion: @escaping([DetailContentResponseDTO]) -> Void)
  func getSearchContent(token: String, keyword: String, completion: @escaping([DetailContentResponseDTO]) -> Void)
  func getRecommendContent(token: String, completion: @escaping([DetailContentResponseDTO]) -> Void)
  func getPopularityContent(token: String, filter: String?, completion: @escaping([DetailContentResponseDTO]) -> Void)
  func getDetailContent(token: String, pk: Int, completion: @escaping(DetailContentResponseDTO) -> Void)
  func getLikeContent(token: String, filter: String?, completion: @escaping([ContentsLikedResponseDTO]) -> Void)
  func postLikeContent(token: String, pk: Int, completion: @escaping(ContentsLikedResponseDTO) -> Void)
  func postUnlikeContent(token: String, pk: [Int], completion: @escaping(UnlikeResponseDTO) -> Void)
}

final class KeyneezContentRepository: ContentRepositoryProtocol {
  
  func getAllContents(token: String, filter: String?, completion: @escaping ([DetailContentResponseDTO]) -> Void) {
    print(token)
    ContentAPIProvider.shared.getAllContent(token: token, filter: filter) { result in
      switch result {
      case .success(let data):
        guard let contentlist = data else { return }
        completion(contentlist)
      case .failure(let failure):
        print("fail")
      }
    }
  }
  
  func getSearchContent(token: String, keyword: String, completion: @escaping ([DetailContentResponseDTO]) -> Void) {
    ContentAPIProvider.shared.getSearchContent(token: token, keyword: keyword) { result in
      switch result {
      case .success(let data):
        guard let searchList = data else { return }
        completion(searchList)
      case .failure(let failure):
        print("fail")
      }
    }
  }
  
  func getRecommendContent(token: String, completion: @escaping ([DetailContentResponseDTO]) -> Void) {
    ContentAPIProvider.shared.getRecommendContent(token: token) { result in
      switch result {
      case .success(let data):
        guard let recommendList = data else { return }
        completion(recommendList)
      case .failure(let failure):
        print("fail")
      }
    }
  }
  
  func getPopularityContent(token: String, filter: String?, completion: @escaping ([DetailContentResponseDTO]) -> Void) {
    ContentAPIProvider.shared.getPopularityContent(token: token, filter: filter) { result in
      switch result {
      case .success(let data):
        guard let popularList = data else {return}
        completion(popularList)
      case .failure(let failure):
        print("fail")
      }
    }
  }
  
  func getDetailContent(token: String, pk: Int, completion: @escaping(DetailContentResponseDTO) -> Void) {
    ContentAPIProvider.shared.getDetailContent(token: token, pk: pk) { result in
      switch result {
      case .success(let data):
        guard let detailContentList = data else { return }
        completion(detailContentList)
      case .failure(let failure):
        print("fail")
      }
    }
  }
  
  func getLikeContent(token: String, filter: String?, completion: @escaping ([ContentsLikedResponseDTO]) -> Void) {
    ContentAPIProvider.shared.getLikeContent(token: token, filter: filter) { result in
      switch result {
      case .success(let data):
        guard let likedContentList = data else { return }
        completion(likedContentList)
      case .failure(let failure):
        print("fail")
      }
    }
  }
  
  func postLikeContent(token: String, pk: Int, completion: @escaping (ContentsLikedResponseDTO) -> Void) {
    ContentAPIProvider.shared.postLikeContent(token: token, pk: pk) { result in
      switch result {
      case .success(let data):
        guard let postLikeContentList = data else {return}
        completion(postLikeContentList)
      case .failure(let failure):
        print("fail")
      }
    }
  }
  
  func postUnlikeContent(token: String, pk: [Int], completion: @escaping (UnlikeResponseDTO) -> Void) {
    ContentAPIProvider.shared.postUnlikeContent(token: token, pk: pk) { result in
      switch result {
      case .success(let data):
       print("success")
      case .failure(let failure):
        print("fail")
      }
    }
  }
}
