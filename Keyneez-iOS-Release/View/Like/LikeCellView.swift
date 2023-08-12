//
//  LikeCellView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/07.
//

import SwiftUI

struct LikeCellView: View {
  @StateObject var viewModel: LikeViewModel
  var columns: [GridItem] = [
    GridItem(.flexible(), spacing: 14), // 가로 간격 설정
    GridItem(.flexible())
  ]
  
  var body: some View {
    LazyVGrid(columns: columns, spacing: 17) {
      ForEach(viewModel.items.indices, id: \.self ) { index in
        ExploreCardViewCell(item: viewModel.items[index])
      }
    }
    .padding([.leading, .trailing], 22)
  }
}

