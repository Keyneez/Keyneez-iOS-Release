//
//  ExploreView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/06/26.
//

import SwiftUI

struct ExploreView: View {
  @State var currentTab: Int = 0
  @State private var ScrollViewOffset: CGFloat = 0
  @State private var StartOffset: CGFloat = 0
  @State private var isNavigationBarHidden = false
  @State var viewPagerSize: CGSize = .zero
  @ObservedObject private var viewModel = PopularityCardViewModel()
  
  var body: some View {
    NavigationStack {
      ZStack(alignment: .top) {
        Color.gray100
          .edgesIgnoringSafeArea(.all)
        ScrollView(.vertical) {
          VStack(alignment: .leading) {
            HStack {
              Spacer()
              NavigationLink(destination: ExploreSearchView(viewModel: ExploreViewModel())) {
                Image("ic_search")
                  .resizable()
                  .frame(width: 18, height: 18)
                  .padding(.trailing, 23)
              }
            }
            Spacer().frame(height: 14)
            Text("탐색하기")
              .font(.pretendard(.semiBold, size: 24))
              .padding(.leading, 25)
            Spacer().frame(height: 24)
            ZStack(alignment: .bottom) {
              Color.gray300
                .frame(height: 0.4)
              ExploreTabBarView(currentTab: self.$currentTab)
            }
            Spacer().frame(height: 25)
            FilterTagView(viewModel: viewModel)
              .padding(.leading, 22)
            Spacer().frame(height: 21)
            TabView(selection: self.$currentTab) {
              ExplorePopularView(viewModel: viewModel).tag(0)
              //크기 동적 변경
                .overlay(GeometryReader { proxy in
                  Color.clear.preference(key: ViewRectKey.self, value: proxy.size)
                })
                .onPreferenceChange(ViewRectKey.self) { size in
                  if self.currentTab == 0 && self.viewPagerSize.height == .zero {
                    self.viewPagerSize = size
                  }
                }
              ExploreRecentView().tag(1)
                .overlay(GeometryReader { proxy in
                  Color.clear.preference(key: ViewRectKey.self, value: proxy.size)
                })
                .onPreferenceChange(ViewRectKey.self) { size in
                  if self.currentTab == 1 && self.viewPagerSize.height == .zero {
                    self.viewPagerSize = size
                  }
                }
            }
            .frame(height: self.viewPagerSize.height + 40)
            .tabViewStyle(.page(indexDisplayMode: .never))
          }
          .overlay(
            GeometryReader { proxy -> Color in
              DispatchQueue.main.async {
                if StartOffset == 0 {
                  self.StartOffset = proxy.frame(in: .global).minY
                }
                let offset = proxy.frame(in: .global).minY
                self.ScrollViewOffset = offset - StartOffset
              }
              return Color.clear
            }
              .frame(width: 0, height: 0)
            ,alignment: .top
            
          )
        }
        .overlay(
          CustomNavigationBarView()
            .ignoresSafeArea(.all)
            .opacity(-ScrollViewOffset > 10 ? 1 : 0)
            .animation(.easeIn)
          ,alignment: .top
        )
      }
      .scrollIndicators(.hidden)
      .background(Color.gray100)
    }
  }
}


extension ExploreView {
  
  struct ViewRectKey: PreferenceKey {
    static let defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
      value = nextValue()
    }
  }
  
  struct CustomNavigationBarView: View {
    var body: some View {
      VStack(spacing:0) {
        ZStack(alignment: .bottom) {
          Color.navigationColor
            .edgesIgnoringSafeArea(.all)
          HStack {
            Spacer()
            Text("탐색하기")
              .font(.pretendard(.semiBold, size: 18))
              .foregroundColor(.gray900)
              .padding(.leading, 24.adjusted)
            Spacer()
            NavigationLink(destination: ExploreSearchView(viewModel: ExploreViewModel())) {
              Image("ic_search")
                .resizable()
                .resizable()
                .frame(width: 18, height: 18)
            }
          }
          .padding(.horizontal, 24)
          .padding(.bottom, 12)
        }
        Color.gray400
          .frame(height: 0.5)
          .opacity(0.4)
      }
      .frame(height: 100)
    }
  }
}



struct ExploreView_Previews: PreviewProvider {
  static var previews: some View {
    ExploreView()
  }
}

