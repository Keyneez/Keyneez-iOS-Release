//
//  CardViewCell.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/06/23.
//

import SwiftUI

struct HomeCardCell: View {
  let model: DetailContentResponseDTO
  @ObservedObject private var likeViewModel = LikedCardViewModel()
  @State private var isLiked: Bool = false

  var body: some View {
    GeometryReader { geo in
      Color.white
      VStack(alignment: .leading) {
        Spacer().frame(height: 16)
        HStack {
          Text(model.category)
            .font(.pretendard(.medium, size: 10))
            .foregroundColor(.gray050)
            .padding(.horizontal, 7)
            .padding(.vertical, 3.5)
            .background(Color.categoryColor(for: model.category))
            .cornerRadius(53)
          Spacer()
          Button {
            if !isLiked {
              likeViewModel.fetchPostLikedCard(pk: model.contentPk)
            } else {
              likeViewModel.fetchPostUnlikedCard(pk: [model.contentPk])
            }
            isLiked.toggle()
          } label: {
            Image(isLiked ? "ic_heart_on" : "ic_heart_off")
          }
        }
        Spacer().frame(height: 9)
        Text(model.title)
          .font(.pretendard(.bold, size: 14))
          .foregroundColor(.gray900)
        Spacer().frame(height: 6)
        Text(model.periodString)
          .font(.pretendard(.medium, size: 8))
          .foregroundColor(.gray400)
        Spacer().frame(height: 9)
        Image(model.imgName)
          .resizable()
          .frame(width: 110, height: 110)
      }
      .padding(.horizontal,14)
      
    }
    .frame(width: 141, height: 220)
    .cornerRadius(14)
    .onAppear {
      isLiked = model.isHeartOn
    }
  }
}


