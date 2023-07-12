//
//  ExploreCardViewCell.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/13.
//

import SwiftUI

struct ExploreCardViewCell: View {
  @StateObject private var viewModel = CardViewModel()

  var body: some View {
    GeometryReader { geo in
      Color.white
      VStack(alignment: .leading) {
        Spacer().frame(height: 19)
        HStack {
          Text("취미")
            .tagViewStyle(widthSize: 12, heightSize: 5, textCGFloat: 11)
          Spacer()
          Button {
            viewModel.toggleLike()
          } label: {
            viewModel.isClickedLike ? Image("ic_heart_on") : Image("ic_heart_off")
          }
        }
        Spacer().frame(height: 11)
        Text("Text\nTextText")
          .font(.pretendard(.bold, size: 16))
          .foregroundColor(.gray900)
        Spacer().frame(height: 8)
        Text("2000.00.00 - 00.00")
          .font(.pretendard(.medium, size: 10))
          .foregroundColor(.gray400)
        Spacer().frame(height: 8)
        Image("hobby")
          .resizable()
          .frame(width: 133, height: 133)
      }
      .padding([.leading,.trailing],14)
      
    }
    .frame(width: 165, height: 258)
    .cornerRadius(16)
    
  }
}

struct ExploreCardViewCell_Previews: PreviewProvider {
    static var previews: some View {
        ExploreCardViewCell()
    }
}
