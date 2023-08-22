//
//  ExploreView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/06/26.
//

import SwiftUI

struct ExploreView: View {
  @ObservedObject private var viewModel = ExploreViewModel()
  @ObservedObject private var popularViewModel = PopularityCardViewModel()
  @ObservedObject private var recentViewModel = AllCardViewModel()
  
  var body: some View {
    NavigationStack {
      ZStack(alignment: .top) {
        Color.gray100
          .edgesIgnoringSafeArea(.all)
        ScrollView(.vertical) {
          VStack(alignment: .leading) {
            HStack {
              Spacer()
              NavigationLink(destination: ExploreSearchView()) {
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
              ExploreTabBarView(currentTab: self.$viewModel.currentTab)
            }
            Spacer().frame(height: 25)
            Group {
              if viewModel.currentTab == 0 {
                popularFilterTagView(viewModel: popularViewModel,
                                     selectedButton: $viewModel.popularSelectedButton)
              } else {
                recentFilterTagView(viewModel: recentViewModel,
                                    selectedButton: $viewModel.recentSelectedButton)
              }
            }
            .padding(.leading, 22)
            Spacer().frame(height: 21)
            TabView(selection: self.$viewModel.currentTab) {
              ExploreCardView(cardList: popularViewModel.popularityCardList).tag(0)
              ExploreCardView(cardList: recentViewModel.allCardList).tag(1)
            }
            .frame(height: calculateTotalHeight(itemCount: selectedCardList.count,
                                                itemHeight: 258,
                                                spacing: 17))
            .tabViewStyle(.page(indexDisplayMode: .never))
          }
          .overlay(
            GeometryReader { proxy -> Color in
              DispatchQueue.main.async {
                if viewModel.StartOffset == 0 {
                  self.viewModel.StartOffset = proxy.frame(in: .global).minY
                }
                let offset = proxy.frame(in: .global).minY
                self.viewModel.ScrollViewOffset = offset - viewModel.StartOffset
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
            .opacity(-viewModel.ScrollViewOffset > 10 ? 1 : 0)
            .animation(.easeIn)
          ,alignment: .top
        )
      }
      .scrollIndicators(.hidden)
      .background(Color.gray100)
      .onAppear {
        popularViewModel.fetchPopularityCard(filter: nil)
        recentViewModel.fetchAllCard(filter: nil)
      }
    }
  }
}


extension ExploreView {
  
  private var selectedCardList: [DetailContentResponseDTO] {
    if viewModel.currentTab == 0 {
      return popularViewModel.popularityCardList
    } else {
      return recentViewModel.allCardList
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
            NavigationLink(destination: ExploreSearchView()) {
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

