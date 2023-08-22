//
//  ExploreRecentView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/04.
//

import SwiftUI

struct ExploreRecentView: View {
  var cardList: [DetailContentResponseDTO] = []
  var columns: [GridItem] = [
    GridItem(.flexible(), spacing: 14), // 가로 간격 설정
    GridItem(.flexible())
  ]
  
  var body: some View {
    LazyVGrid(columns: columns, spacing: 17) {
      ForEach(cardList, id: \.contentPk ) { content in
        ExploreCardViewCell(model: content)
      }
    }
    .padding(.horizontal, 22)
  }
}


struct ExplorePopularView: View {
  var cardList: [DetailContentResponseDTO] = []
  var columns: [GridItem] = [
    GridItem(.flexible(), spacing: 14), // 가로 간격 설정
    GridItem(.flexible())
  ]
  
  var body: some View {
    LazyVGrid(columns: columns, spacing: 17) {
      ForEach(cardList, id: \.contentPk ) {content in
        ExploreCardViewCell(model: content)
      }
    }
    .padding(.horizontal, 22)
  }
}

struct ExploreSearchGridView: View {
  @StateObject var viewModel: CardViewModel
  
  var columns: [GridItem] = [
    GridItem(.flexible(), spacing: 14), // 가로 간격 설정
    GridItem(.flexible())
  ]
  
  var body: some View {
    LazyVGrid(columns: columns, spacing: 17) {
      ForEach(viewModel.items.indices, id: \.self ) {index in
        ExploreCardViewCell(item: viewModel.items[index])
      }
    }
    .padding([.leading, .trailing], 22)
  }
}

