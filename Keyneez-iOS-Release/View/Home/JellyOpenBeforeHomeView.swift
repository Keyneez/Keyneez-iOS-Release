//
//  HomeView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/05/25.
//

import SwiftUI

struct JellyOpenBeforeHomeView: View {
  @StateObject private var viewModel = RecommendContentViewModel()

  var rows : [GridItem] = Array(repeating: .init(.fixed(220)), count: 1)
  var body: some View {
    NavigationStack {
      ZStack(alignment: .top) {
        HomeBackgroundView()
        ScrollView(.vertical) {
          VStack(alignment: .leading, spacing: 0) {
            Spacer().frame(height: 17)
            HStack {
              Image("logo")
              Spacer()
            }
            Spacer().frame(height:33)
            //viewModel 빼기
            
            let userName = UserManager.shared.user?.nickName
            Text(userName ?? "11")
              .font(.pretendard(.bold, size: 24))
              .foregroundColor(.gray900)
            +
            Text("님을 위한")
              .font(.pretendard(.semiBold, size: 24))
//            JellyView()
            WeekRecommendCollectionView()

            Spacer().frame(height: 30)
            NavigationLink(destination: RecentUpdateDetailView(viewModel: CardViewModel())) {
              HStack {
                Text("최근 업데이트")
                  .font(.pretendard(.semiBold, size: 24))
                  .foregroundColor(Color.gray900)
                Image("ic_detail")
                  .resizable()
                  .frame(width: 5, height: 10)
              }
            }

            Spacer().frame(height: 19)
            ScrollView(.horizontal) {
              LazyHGrid(rows: rows, spacing: 15) {
                ForEach(viewModel.recommendContentList, id: \.contentPk) {content in
                  HomeRecommendCardCell(model: content)
                }
              }
            }
            .scrollIndicators(.hidden)
          }
          .padding([.leading, .trailing], 28)
        }
        .scrollIndicators(.hidden)
      }
    }
  }
}

