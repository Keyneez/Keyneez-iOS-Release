//
//  ExploreRecentView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/04.
//

import SwiftUI

struct ExploreRecentView: View {
  @StateObject var viewModel = AllCardViewModel()
  var columns: [GridItem] = [
    GridItem(.flexible(), spacing: 14), // 가로 간격 설정
    GridItem(.flexible())
  ]
  
  var body: some View {
    LazyVGrid(columns: columns, spacing: 17) {
      ForEach(viewModel.allCardList, id: \.contentPk ) { content in
        ExploreCardViewCell(model: content)
      }
    }
    .padding(.horizontal, 22)
    .onAppear {
      viewModel.fetchAllCard()
    }
  }
}


struct ExplorePopularView: View {
  @ObservedObject var viewModel: PopularityCardViewModel
  @State private var contentHeight: CGFloat = .zero
  var columns: [GridItem] = [
    GridItem(.flexible(), spacing: 14), // 가로 간격 설정
    GridItem(.flexible())
  ]
  
  var body: some View {
    LazyVGrid(columns: columns, spacing: 17) {
      ForEach(viewModel.popularityCardList, id: \.contentPk ) {content in
        ExploreCardViewCell(model: content)
      }
    }
    .padding(.horizontal, 22)
    .onAppear {
      viewModel.fetchPopularityCard(filter: nil)
    }
  }
}

