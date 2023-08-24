//
//  CardViewCell.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/06/23.
//

import SwiftUI

struct RecommendCardCell: View {
  let screenSize: CGSize
  let width: CGFloat
  @State private var heart: Bool = false
  let model: DetailContentResponseDTO
  
  var body: some View {
    GeometryReader { geo in
      //Middle Card Zoom
      let midX = geo.frame(in: .global).midX
      let distance = abs(screenSize.width / 2 - midX)
      let damping: CGFloat = 15
      let percentage = abs(distance / (screenSize.width / 2) / damping - 1)
      
      VStack(alignment: .trailing) {
        VStack(alignment: .leading) {
          Spacer().frame(height: 20)
          HStack {
            Text(model.category)
              .font(.pretendard(.medium, size: 16))
              .foregroundColor(.gray050)
              .padding(.horizontal, 11)
              .padding(.vertical, 5)
              .background(Color.categoryColor(for: model.category))
              .cornerRadius(53)
            Spacer()
            Button {
              heart.toggle()
            } label: {
              if heart {
                Image("ic_heart_on")
                  .resizable()
                  .frame(width: 38, height: 32)
              }else {
                Image("ic_heart_off")
                  .resizable()
                  .frame(width: 38, height: 32)
              }
            }
          }
          Spacer().frame(height: 16)
          Text(model.title)
            .font(.pretendard(.bold, size: 26))
            .foregroundColor(.gray900)
          Spacer().frame(height: 10)
          Text(model.periodString)
            .font(.pretendard(.medium, size: 18))
            .foregroundColor(.gray400)
          Spacer().frame(height: 15)
          Image(model.imgName)
            .resizable()
            .frame(width: 209, height: 209)
            .scaledToFill()
        }
        .padding([.leading,.trailing],28)
        Spacer().frame(height: 1)
        HStack {
          Text("자세히 보기")
            .font(.pretendard(.semiBold, size: 16))
          Image(systemName: "chevron.right")
            .resizable()
            .frame(width: 5, height: 10)
        }
        .foregroundColor(.gray400)
        .padding(.trailing, 17)
      }
      .frame(maxHeight: .infinity)
      .background(Color.white)
      .cornerRadius(28)
      .scaleEffect(percentage)

    }
    .frame(width: width, height: 440)
    .cornerRadius(28)
  }
}

