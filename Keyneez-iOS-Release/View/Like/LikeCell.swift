//
//  LikeCellView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/07.
//

import SwiftUI

struct LikeCell: View {
  @Binding var cardList: [ContentsLikedResponseDTO] 
  var columns: [GridItem] = [
    GridItem(.flexible(), spacing: 14), // 가로 간격 설정
    GridItem(.flexible())
  ]
  
  var body: some View {
    LazyVGrid(columns: columns, spacing: 17) {
      ForEach(cardList, id: \.contentPk ) { content in
        LikeCardViewCell(model: content, cardList: $cardList)
      }
    }
    .padding(.horizontal, 22)
  }
}

