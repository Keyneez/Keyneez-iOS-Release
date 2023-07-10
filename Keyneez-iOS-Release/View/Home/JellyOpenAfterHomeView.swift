//
//  JellyOpenAfterView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/11.
//

import SwiftUI

struct JellyOpenAfterHomeView: View {
  var rows : [GridItem] = Array(repeating: .init(.fixed(220)), count: 1)
  var body: some View {
    NavigationStack {
      ZStack(alignment: .top) {
        HomeBackgroundView()
        ScrollView(.vertical) {
          VStack(alignment: .leading) {
            Spacer().frame(height: 17)
            HStack {
              Image("logo")
              Spacer()
            }
            Spacer().frame(height:33)
            //viewModel 빼기
            let userName = "민지너는최고"
            NavigationLink(destination: MainRecommendView()) {
              HStack(alignment: .bottom) {
                Text("\(userName)")
                  .font(.pretendard(.bold, size: 24))
                  .foregroundColor(.gray900)
                +
                  Text("님을 위한\n이번 주의 추천 활동 보기")
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
              LazyHGrid(rows: rows, spacing: 15) {
                ForEach((0...5), id: \.self ) {_ in
                  HomeCardViewCell()
                }
              }
            }
            .scrollIndicators(.hidden)
            
            Spacer().frame(height: 30)
            HStack {
              Text("최근 업데이트")
                .font(.pretendard(.semiBold, size: 24))
                .foregroundColor(Color.gray900)
              Image("ic_detail")
                .resizable()
                .frame(width: 7, height: 10)
            }
          }
          Spacer().frame(height: 21)
          ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 15) {
              ForEach((0...5), id: \.self ) {_ in
                HomeCardViewCell()
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



struct JellyOpenAfterView_Previews: PreviewProvider {
  static var previews: some View {
    JellyOpenAfterHomeView()
  }
}
