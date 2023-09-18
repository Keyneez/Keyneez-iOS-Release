//
//  LikedCardViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/21.
//

import Foundation

final class LikedCardViewModel: ObservableObject {
  @Published var likedCardList: [ContentsLikedResponseDTO] = []
  @Published var postLikedCardList: Likes?
  @Published var postUnlikedCardList: UnlikeResponseDTO?
  
  func fetchGetLikedCard(filter: String?) {
    if let token = UserManager.shared.accessToken {
      ContentAPIProvider.shared.getLikeContent(token: token, filter: filter) { [weak self] result in
        switch result {
        case .success(let data):
          if let likedList = data {
            DispatchQueue.main.async {
              self?.likedCardList = likedList
            }
          }
        case .failure(let error):
          print("Fail to fetch like content: \(error)")
          DispatchQueue.main.async {
            self?.likedCardList = []
          }
        }
      }
    }
  }
  
  func fetchPostLikedCard(pk: Int) {
    if let token = UserManager.shared.accessToken {
      ContentAPIProvider.shared.postLikeContent(token: token, pk: pk) { [weak self] result in
        switch result {
        case .success(let data) :
          if let postLikedCardList = data {
            DispatchQueue.main.async {
              self?.postLikedCardList = postLikedCardList
              print("fetchList : \(postLikedCardList)")
            }
          }
        case .failure(let error):
          print("Fail to fetch post like content: \(error)")
        }
      }
    }
  }
  
  func fetchPostUnlikedCard(pk: [Int]) {
    if let token = UserManager.shared.accessToken {
      ContentAPIProvider.shared.postUnlikeContent(token: token, pk: pk) { [weak self] result in
        switch result {
        case .success(let data) :
          if let postUnlikedCardList = data {
            DispatchQueue.main.async {
              self?.postUnlikedCardList = postUnlikedCardList
            }
          }
        case .failure(let error):
          print("Fail to fetch post unlike content: \(error)")
        }
      }
    }
  }
}
