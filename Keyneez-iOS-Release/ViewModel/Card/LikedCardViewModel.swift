//
//  LikedCardViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/21.
//

import Foundation

final class LikedCardViewModel: ObservableObject {
  @Published var likedCardList: [ContentsLikedResponseDTO] = []
  @Published var filter: String?
  
  func fetchLikedCard() {
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
          print("Fail to fetch recommend content: \(error)")
        }
      }
    }
  }
}
