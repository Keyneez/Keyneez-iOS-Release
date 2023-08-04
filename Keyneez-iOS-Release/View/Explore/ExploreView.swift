//
//  ExploreView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/06/26.
//

import SwiftUI

struct ExploreView: View {
    @State var currentTab: Int = 0
    @State private var isNavigationBarHidden = false
  
  func getStatusBarHeight() -> CGFloat {
      let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
      return keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
  }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.gray100
                    .edgesIgnoringSafeArea(.all)

                ScrollView {
                    ScrollViewReader { scrollViewProxy in
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

                            ExploreFilterTagView()
                                .padding(.leading, 22)
                            Spacer().frame(height: 21)

                            TabView(selection: self.$currentTab) {
                                ExplorePopularView().tag(0)
                                ExploreRecentView().tag(1)
                            }
                            //MARK: - 셀 개수 받아서 높이 계산해주는 함수 필요
                            .frame(height: 800 )
                            .tabViewStyle(.page(indexDisplayMode: .never))
                        }
                        .onAppear {
                            scrollViewProxy.scrollTo(0) // 맨 위로 스크롤하여 navigation bar를 숨기는 효과를 주기 위해
                        }
                        .onDisappear {
                            isNavigationBarHidden = false // 뷰를 떠날 때 navigation bar 숨기는 상태를 초기화합니다.
                        }

                    }
                }

            }
            .scrollIndicators(.hidden)
            .background(Color.gray100)
        }
    }
}


extension ExploreView {
  struct CustomNavigationBarView: View {
    var body: some View {
      VStack(spacing:0) {
        ZStack {
          Color.navigationColor
            .edgesIgnoringSafeArea(.all)
          HStack {
            Spacer()
            Text("탐색하기")
              .font(.pretendard(.semiBold, size: 18))
              .foregroundColor(.gray900)
            Spacer()
              NavigationLink(destination: ExploreSearchView(viewModel: ExploreViewModel())) {
                  Image("ic_search")
                    .resizable()
                    .resizable()
                    .frame(width: 100, height: 100)
              }
          }
          .padding([.leading, .trailing], 24)
        }
        Color.gray400
          .frame(height: 0.5)
          .opacity(0.4)
      }
      .frame(height: 50)
    }
  }
}



struct ExploreView_Previews: PreviewProvider {
  static var previews: some View {
    ExploreView()
  }
}
