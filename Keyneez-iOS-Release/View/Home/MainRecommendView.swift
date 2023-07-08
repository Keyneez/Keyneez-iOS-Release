//
//  MainRecommendView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/09.
//

import SwiftUI

struct MainRecommendView: View {
  @State private var selected = 0
  var body: some View {
    ZStack {
      HomeBackgroundView()
      TeasingTabView(selectedTab: $selected, spacing: 15) { [
        AnyView(RecommendCardViewCell()),
        AnyView(RecommendCardViewCell()),
        AnyView(RecommendCardViewCell()),
        AnyView(RecommendCardViewCell()),
        AnyView(RecommendCardViewCell())
      ]
      }
    }
  }
}

struct MainRecommendView_Previews: PreviewProvider {
    static var previews: some View {
        MainRecommendView()
    }
}
