//
//  ExploreRecentView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/04.
//

import SwiftUI

struct ExploreCardView: View {
  var cardList: [DetailContentResponseDTO] = []
  var columns: [GridItem] = [
    GridItem(.flexible(), spacing: 14), // 가로 간격 설정
    GridItem(.flexible())
  ]
  
  var body: some View {
    LazyVGrid(columns: columns, spacing: 17) {
      ForEach(cardList, id: \.contentPk ) { content in
        NavigationLink(destination: DetailView(pk: content.contentPk)) {
          ExploreCardViewCell(model: content)
        }
      }
    }
    .padding(.horizontal, 22)
  }
}

