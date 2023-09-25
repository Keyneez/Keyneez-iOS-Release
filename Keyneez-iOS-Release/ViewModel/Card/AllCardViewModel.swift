//
//  RecentCardViewModel.swift
//  Keyneez-iOS-Release
// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2OTUxMjk5NTEsImV4cCI6MTY5NzcyMTk1MSwiaXNzIjoiS2VlbmV6In0.WqLt5NCNTkQNUzVONuQAehS9ZJs4R3cfH-LN9RWJLJo
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
              print("allList: \(allList)")
            }
          }
        case .failure(let error):
          print("Fail to fetch all content: \(error)")
        }
      }
    }
  }
}
