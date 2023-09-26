//
//  MainRecommendView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/09.
//

import SwiftUI

struct MainRecommendView: View {
  @State private var selected = 0
  @EnvironmentObject var router: Router

  var body: some View {
    ZStack(alignment: .top) {
      HomeBackgroundView()
      VStack {
        HStack {
          Button {
            router.clear()
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
    .navigationDestination(for: Views.self){ destination in
      ViewFactory.viewForDestination(destination)
    }
    .navigationBarBackButtonHidden(true)
  }
}

struct MainRecommendView_Previews: PreviewProvider {
  static var previews: some View {
    MainRecommendView()
  }
}
