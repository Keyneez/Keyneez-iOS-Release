//
//  DetailViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/07/09.
//

import Foundation
import SwiftUI
import Moya

class DetailViewModel: ObservableObject {
  @Published var detailViewImage: String = "Detail_Activity_01"
  @Published var detailContent = DetailContentResponseDTO(contentPk: 0, title: "", category: "", link: "https://www.naver.com", place: "", introduction: "", inquiry: [], price: [], benefit: [], createdAt: "", updatedAt: "")
  
  func getDetailView(pk: Int) {
    if let token = UserManager.shared.accessToken {
      ContentAPIProvider.shared.getDetailContent(token: token, pk: pk) { [weak self] result in
        switch result {
        case .success(let data):
          if let detailContent = data {
            DispatchQueue.main.async {
              self?.detailContent = detailContent
            }
          }
        case .failure(let error):
          print("Fail to fetch recommend content: \(error)")
        }
      }
    }
  }
  
  func makeMultipleLines(strings: [String]) -> String {
    if strings.isEmpty {
      return ""
    } else {
      var contents = ""
      strings.forEach { content in
        contents += "\(content)\n"
      }
      return String(contents.dropLast())
    }
  }
}
