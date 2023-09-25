//
//  MainRecommendView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/09.
//

import SwiftUI

struct MainRecommendView: View {
  @State private var selected = 0
  @Environment(\.dismiss) private var dismiss
  var body: some View {
    ZStack(alignment: .top) {
      HomeBackgroundView()
      VStack {
        HStack {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark")
              .resizable()
              .frame(width: 16, height: 16)
              .foregroundColor(.gray900)
          }
          
          Spacer()
        }
        .padding(.top, 12)
        .padding(.leading, 25)
        Spacer().frame(height: 77)
        Text("이번 달의 추천 활동들이에요!")
          .font(.pretendard(.semiBold, size: 24))
        Spacer().frame(height: 49)
        TeasingTabView(selectedTab: $selected, spacing: 8).frame(height: 480)
      }
    }
    .navigationBarBackButtonHidden(true)
  }
}

struct MainRecommendView_Previews: PreviewProvider {
  static var previews: some View {
    MainRecommendView()
  }
}
