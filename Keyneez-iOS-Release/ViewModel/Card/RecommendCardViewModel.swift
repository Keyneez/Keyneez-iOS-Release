//
//  RecommendCardViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/20.
//

import Foundation

final class RecommendContentViewModel: ObservableObject {
  @Published var recommendContentList: [DetailContentResponseDTO] = []
  
  func fetchRecommendContent() {
    if let token = UserManager.shared.accessToken {
      ContentAPIProvider.shared.getRecommendContent(token: token) { [weak self] result in
        switch result {
        case .success(let data):
          if let recommendList = data {
            DispatchQueue.main.async {
              self?.recommendContentList = recommendList
            }
          }
        case .failure(let error):
          print("Fail to fetch recommend content: \(error)")
        }
      }
    }
  }
}

