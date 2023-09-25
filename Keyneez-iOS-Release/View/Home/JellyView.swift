//
//  JellyView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/12.
//

import SwiftUI

struct JellyView: View {
    var body: some View {
      VStack {
      Text("이번 달의 젤리봉투를 열어보세요!")
        .font(.pretendard(.semiBold, size: 24))
        .foregroundColor(.gray900)
      Spacer().frame(height: 20)
        NavigationLink(destination: JellyGifImageView()) {
          Image("jelly")
            .resizable()
            .frame(width: 310, height: 310)
        }
      }
    }
}

struct JellyView_Previews: PreviewProvider {
    static var previews: some View {
        JellyView()
    }
}
