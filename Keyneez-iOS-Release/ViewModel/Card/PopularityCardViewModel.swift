//
//  PopularityCardViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/21.
//

import Foundation

final class PopularityCardViewModel: ObservableObject {
  @Published var popularityCardList: [DetailContentResponseDTO] = []
  @Published var filter: String?
  
  func fetchPopularityCard() {
    if let token = UserManager.shared.accessToken {
      ContentAPIProvider.shared.getPopularityContent(token: token, filter: filter) { [weak self] result in
        switch result {
        case .success(let data):
          if let popularityList = data {
            DispatchQueue.main.async {
              self?.popularityCardList = popularityList
            }
          }
        case .failure(let error):
          print("Fail to fetch recommend content: \(error)")
        }
      }
    }
  }
}
