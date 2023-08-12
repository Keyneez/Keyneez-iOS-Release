//
//  CardViewCell.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/06/23.
//

import SwiftUI

struct HomeCardViewCell: View {
  @StateObject var viewModel: CardViewModel
  var item: CardItem
  
  var body: some View {
    GeometryReader { geo in
      Color.white
      VStack(alignment: .leading) {
        Spacer().frame(height: 16)
        HStack {
          Text("취미")
            .tagViewStyle(widthSize: 7, heightSize: 3.5, textCGFloat: 10)
          Spacer()
          Button {
            viewModel.toggleHeart(for: item)
          } label: {
            item.heart ? Image("ic_heart_on") : Image("ic_heart_off")
          }
        }
        Spacer().frame(height: 9)
        Text("Text\nTextText")
          .font(.pretendard(.bold, size: 14))
          .foregroundColor(.gray900)
        Spacer().frame(height: 6)
        Text("2000.00.00 - 00.00")
          .font(.pretendard(.medium, size: 8))
          .foregroundColor(.gray400)
        Spacer().frame(height: 9)
        Image("hobby")
          .resizable()
          .frame(width: 110, height: 110)
      }
      .padding([.leading,.trailing],14)
      
    }
    .frame(width: 141, height: 220)
    .cornerRadius(14)
    
  }
}


