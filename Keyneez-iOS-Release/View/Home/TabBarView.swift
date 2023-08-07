//
//  TabView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/06/26.
//

import SwiftUI

struct TabBarView: View {
  @State private var selectedTab: Tab = .home
  
  enum Tab {
    case home
    case explore
    case like
    case setting
  }
  
  var body: some View {
    TabView(selection: $selectedTab) {
        JellyOpenBeforeHomeView()
          .tabItem {
            Image(selectedTab == .home ? "ic_home_fill" : "ic_home")
            Text("홈")
          }
          .tag(Tab.home)

      ExploreView()
        .tabItem {
          Image(selectedTab == .explore ? "ic_explore_fill" : "ic_explore")
          Text("탐색")
        }
        .tag(Tab.explore)
      
      LikeView(viewModel: LikeViewModel())
        .tabItem {
          Image(selectedTab == .like ? "ic_like_fill" : "ic_like")
          Text("좋아요")
        }
        .tag(Tab.like)
      
      SettingView()
        .tabItem {
          Image(selectedTab == .setting ? "ic_setting_fill" : "ic_setting")
          Text("설정")
      }
        .tag(Tab.setting)
    }
    .accentColor(.gray900)
  }
}

struct TabView_Previews: PreviewProvider {
  static var previews: some View {
    TabBarView()
  }
}
