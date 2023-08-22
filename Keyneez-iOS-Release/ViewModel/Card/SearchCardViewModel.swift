//
//  SearchCardViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/23.
//

import Foundation

final class SearchCardViewModel: ObservableObject {
  @Published var searchCardList: [DetailContentResponseDTO] = []
  
  func fetchSearchCard(keyword: String) {
    if let token = UserManager.shared.accessToken {
      ContentAPIProvider.shared.getSearchContent(token: token, keyword: keyword) { [weak self] result in
        switch result {
        case .success(let data):
          if let searchList = data {
            DispatchQueue.main.async {
              self?.searchCardList = searchList
            }
          }
        case .failure(let error):
          print("Fail to fetch search content: \(error)")
          DispatchQueue.main.async {
            self?.searchCardList = []
          }
        }
      }
    }
  }
}
