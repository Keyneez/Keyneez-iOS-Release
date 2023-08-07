//
//  ExploreTabBarView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/04.
//

import SwiftUI

struct ExploreTabBarView: View {
  @Binding var currentTab: Int
  @Namespace var namespace
  
  var tabBarOptions : [String] = ["인기","최신"]
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 23) {
        ForEach(Array(zip(self.tabBarOptions.indices,
                          self.tabBarOptions)),
                id: \.0,
                content: {
          index,name in
          ExploreTabBarItemView(currentTab: self.$currentTab,
                     namespace: namespace.self,
                     tabBarItemName: name,
                     tab: index)
        })
      }
      .padding(.leading, 25)
      
    }
    .frame( height: 40)
    .edgesIgnoringSafeArea(.all)
  }
}

struct ExploreTabBarItemView: View {
  @Binding var currentTab: Int
  let namespace: Namespace.ID
  
  var tabBarItemName: String
  var tab: Int
  
  var body: some View {
    Button {
      self.currentTab = tab
    } label: {
      VStack {
        Spacer()
        Text(tabBarItemName)
          .font(.pretendard(.semiBold, size: 18))
          .foregroundColor(currentTab == tab ? .gray900 : .gray400)
        if currentTab == tab {
          Color.gray900
            .frame(height: 2)
            .matchedGeometryEffect(id: "underline",
                                   in: namespace,
                                   properties: .frame)
        } else {
          Color.clear.frame(height: 2)
          
        }
      }
      .animation(.spring(), value: self.currentTab)
    }
    .buttonStyle(.plain)
  }
}
