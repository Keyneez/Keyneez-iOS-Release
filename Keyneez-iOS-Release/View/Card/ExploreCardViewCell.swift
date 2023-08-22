//
//  ExploreCardViewCell.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/13.
//

import SwiftUI

struct ExploreCardViewCell: View {
  @State private var heart: Bool = false
  @State var model: DetailContentResponseDTO

  var body: some View {
    GeometryReader { geo in
      Color.white
      VStack(alignment: .leading) {
        Spacer().frame(height: 19)
        HStack {
          Text(model.category)
            .font(.pretendard(.medium, size: 12))
            .foregroundColor(.gray050)
            .padding(.horizontal, 8.5)
            .padding(.vertical, 4)
            .background(Color.categoryColor(for: model.category))
            .cornerRadius(53)
          Spacer()
          Button {
            heart.toggle()
          } label: {
              if heart {
                  Image("ic_heart_on")
              } else {
                  Image("ic_heart_off")
              }
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
