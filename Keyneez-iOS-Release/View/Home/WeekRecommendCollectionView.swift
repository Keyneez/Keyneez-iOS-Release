//
//  WeekRecommendCollectionView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/12.
//

import SwiftUI

struct WeekRecommendCollectionView: View {
  var rows : [GridItem] = Array(repeating: .init(.fixed(220)), count: 1)
  var body: some View {
    VStack(alignment: .leading) {
      NavigationLink(destination: MainRecommendView()) {
        HStack(alignment: .bottom) {
          Text("이번 주의 추천 활동 보기")
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
        ZStack {
          LazyHGrid(rows: rows, spacing: 15) {
            ForEach((0...5), id: \.self ) {_ in
              HomeCardViewCell()
            }
          }
          TipKitView()
        }
      }
      .scrollIndicators(.hidden)
    }
    
  }
}


struct WeekRecommendCollectionView_Previews: PreviewProvider {
  static var previews: some View {
    WeekRecommendCollectionView()
  }
}
