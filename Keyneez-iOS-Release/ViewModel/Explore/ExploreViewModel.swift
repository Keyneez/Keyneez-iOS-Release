//
//  ExploreViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/27.
//

import SwiftUI

class ExploreViewModel: ObservableObject {
  @Published var popularViewModel = PopularityCardViewModel()
  @Published var recentViewModel = AllCardViewModel()
  @Published var serachKey: String = ""
  @Published var exploreSearchNumber: Int = 0
  
  // 데이터 비동기 로딩 메서드
  func loadData(completion: @escaping (Bool) -> Void) {
    // 비동기로 popularViewModel과 recentViewModel의 데이터를 로드
    popularViewModel.fetchPopularityCard()
    recentViewModel.fetchAllCard()
    
    // 로드가 성공적으로 완료되면 completion(true) 호출, 실패하면 completion(false) 호출
    // 로드 실패 시에는 에러 처리를 추가해야 함
    // 여기에서는 단순히 로드가 성공적으로 완료되었다고 가정
    completion(true)
  }
}

