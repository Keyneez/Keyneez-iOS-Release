//
//  RecommendView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/08.
//

import SwiftUI

struct MainRecommendView: View {
  var body: some View {
    ZStack {
      HomeBackgroundView()
      VStack {
        Text("이번 주의 추천 활동들이에요!")
          .font(.pretendard(.semiBold, size: 24))
      }
      .navigationBarBackButtonHidden(true)
    }
  }
}

struct MainRecommendView_Previews: PreviewProvider {
    static var previews: some View {
        MainRecommendView()
    }
}
