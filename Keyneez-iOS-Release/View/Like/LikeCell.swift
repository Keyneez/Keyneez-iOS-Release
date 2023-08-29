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
    .frame(maxWidth: .infinity, minHeight: 258)
  }
}

struct LikeEditCell: View {
  @Binding var cardList: [ContentsLikedResponseDTO]
  @ObservedObject var viewModel: LikeViewModel
  
  var columns: [GridItem] = [
    GridItem(.flexible(), spacing: 14), // 가로 간격 설정
    GridItem(.flexible())
  ]
  
  var body: some View {
    LazyVGrid(columns: columns, spacing: 17) {
      ForEach(cardList, id: \.contentPk ) { content in
        ZStack(alignment: .topLeading) {
          Button {
            viewModel.action(.onTapCardCellButton(pk: content.contentPk))
          } label: {
            LikeCardViewCell(model: content, cardList: $cardList)
              .disabled(true)
          }
          if viewModel.selectedContentPks.contains(content.contentPk) {
            ZStack(alignment: .topTrailing) {
              Button {
                viewModel.action(.onTapCardCellButton(pk: content.contentPk))
              }label: {
                Rectangle().foregroundColor(.black.opacity(0.3))
              }
              .cornerRadius(16)
              Image("on")
                .offset(x: -11, y: 12)
            }
          }
        }
      }
    }
    .padding(.horizontal, 22)
    .frame(maxWidth: .infinity, minHeight: 258)
  }
  
}
