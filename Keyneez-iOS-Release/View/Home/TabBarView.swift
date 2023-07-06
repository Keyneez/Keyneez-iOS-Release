//
//  TabView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/06/26.
//

import SwiftUI

struct TabView: View {
    var body: some View {
      {
        HomeView()
          .tabItem {
            Image("ic_home")
            Text("홈")
          }
        ExploreView()
          .tabItem {
            Image("ic_explore")
            Text("탐색")

          }
      }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
