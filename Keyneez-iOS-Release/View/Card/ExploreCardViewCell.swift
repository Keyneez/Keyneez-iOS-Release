//
//  ExploreCardViewCell.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/13.
//

import SwiftUI

struct ExploreCardViewCell: View {
  @StateObject private var viewModel = CardViewModel()
  @State private var heart: Bool
  var item: CardItem

  init(item: CardItem) {
      self._heart = State(initialValue: item.heart)
      self.item = item
  }

  var body: some View {
    GeometryReader { geo in
      Color.white
      VStack(alignment: .leading) {
        Spacer().frame(height: 19)
        HStack {
          Text(item.tag.description)
            .tagViewStyle(widthSize: 12, heightSize: 5, textCGFloat: 11)
            .foregroundColor(item.tag.color)
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
          Text(item.title)
          .font(.pretendard(.bold, size: 16))
          .foregroundColor(.gray900)
        Spacer().frame(height: 8)
        Text("\(item.startAt) - \(item.endAt)")
          .font(.pretendard(.medium, size: 10))
          .foregroundColor(.gray400)
        Spacer().frame(height: 8)
        Image(item.img)
          .resizable()
          .frame(width: 133, height: 133)
      }
      .padding(.horizontal, 14)
      
    }
    .frame(width: 165, height: 258)
    .cornerRadius(16)
    
  }
}
