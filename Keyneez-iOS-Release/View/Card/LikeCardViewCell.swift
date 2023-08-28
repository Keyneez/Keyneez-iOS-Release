//
//  LikeCardViewCell.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/21.
//

import SwiftUI

struct LikeCardViewCell: View {
  @State private var isLiked: Bool = true
  let model: ContentsLikedResponseDTO
  @ObservedObject private var likeViewModel = LikedCardViewModel()
  @Binding var cardList: [ContentsLikedResponseDTO]

  var body: some View {
    GeometryReader { geo in
      Color.white
      VStack(alignment: .leading) {
        Spacer().frame(height: 19)
        HStack {
          Text(model.category)
            .tagViewStyle(widthSize: 12, heightSize: 5, textCGFloat: 11)
            .foregroundColor(Color.categoryColor(for: model.category))
          Spacer()
          Button {
            likeViewModel.fetchPostUnlikedCard(pk: [model.contentPk])
            isLiked = false
            withAnimation {
                cardList.removeAll { $0.contentPk == model.contentPk }
            }
          } label: {
            Image(isLiked ? "ic_heart_on" : "ic_heart_off")
          }
        }
        Spacer().frame(height: 11)
          Text(model.title)
          .font(.pretendard(.bold, size: 16))
          .foregroundColor(.gray900)
        Spacer().frame(height: 8)
        Text(model.periodString)
          .font(.pretendard(.medium, size: 10))
          .foregroundColor(.gray400)
        Spacer().frame(height: 8)
        Image(model.imgName)
          .resizable()
          .frame(width: 133, height: 133)
      }
      .padding(.horizontal, 14)
      
    }
    .frame(width: 165, height: 258)
    .cornerRadius(16)
    
  }
}
