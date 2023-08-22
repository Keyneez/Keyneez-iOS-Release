//
//  RecentCardViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/21.
//

import Foundation

final class AllCardViewModel: ObservableObject {
  @Published var allCardList: [DetailContentResponseDTO] = []
  
  func fetchAllCard(filter: String?) {
    if let token = UserManager.shared.accessToken {
      ContentAPIProvider.shared.getAllContent(token: token, filter: filter) { [weak self] result in
        switch result {
        case .success(let data):
          if let allList = data {
            DispatchQueue.main.async {
              self?.allCardList = allList
            }
          }
        case .failure(let error):
          print("Fail to fetch recommend content: \(error)")
        }
      }
    }
  }
}
