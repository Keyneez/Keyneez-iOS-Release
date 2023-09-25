//
//  WeekRecommendCollectionView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/12.
//

import SwiftUI

struct WeekRecommendCollectionView: View {
  @StateObject private var viewModel = RecommendCardViewModel()
  var rows : [GridItem] = Array(repeating: .init(.fixed(220)), count: 1)
  var body: some View {
    VStack(alignment: .leading) {
      NavigationLink(destination: MainRecommendView()) {
        HStack(alignment: .bottom) {
          Text("이번 달의 추천 활동 보기")
            .font(.pretendard(.semiBold, size: 24))
            .foregroundColor(.gray900)
          Image("ic_detail")
            .resizable()
            .frame(width: 7, height: 10)
            .padding(.bottom, 8)
        }
        
      }
      Spacer().frame(height: 30)
      ScrollView(.horizontal) {
        ZStack(alignment: .topLeading) {
          LazyHGrid(rows: rows, spacing: 15) {
            ForEach(viewModel.recommendCardList, id: \.contentPk) {content in
              NavigationLink(destination: DetailView(pk: content.contentPk)) {
                HomeRecommendCardCell(model: content)
              }
            }
          }
        }
      }
      .scrollIndicators(.hidden)
    }
    .onAppear {
      viewModel.fetchRecommendCard()
    }
  }
}
