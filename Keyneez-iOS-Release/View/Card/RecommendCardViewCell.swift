//
//  CardViewCell.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/06/23.
//

import SwiftUI

struct RecommendCardViewCell: View {
  @StateObject private var viewModel = CardViewModel()
  
  var body: some View {
    GeometryReader { geo in
      Color.white
      VStack(alignment: .trailing) {
        VStack(alignment: .leading) {
          Spacer().frame(height: 32)
          HStack {
            Text("취미")
              .tagViewStyle(widthSize: 20, heightSize: 9, textCGFloat: 16)
            Spacer()
            Button {
              viewModel.toggleLike()
            } label: {
              if viewModel.isClickedLike {
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
          Text("Text\nTextText")
            .font(.pretendard(.bold, size: 26))
            .foregroundColor(.gray900)
          Spacer().frame(height: 15)
          Text("2000.00.00 - 00.00")
            .font(.pretendard(.medium, size: 18))
            .foregroundColor(.gray400)
          Spacer().frame(height: 24)
          Image("hobby")
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
      
    }
    .frame(width: 282, height: 450)
    .cornerRadius(28)
    
  }
}

struct RecommendCardViewCell_Previews: PreviewProvider {
  static var previews: some View {
    RecommendCardViewCell()
  }
}



