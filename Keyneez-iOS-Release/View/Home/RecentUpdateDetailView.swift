//
//  RecentUpdateDetailView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/13.
//

import SwiftUI

struct RecentUpdateDetailView: View {
  var columns: [GridItem] = [
         GridItem(.flexible(), spacing: 19), // 가로 간격 설정
         GridItem(.flexible())
     ]

  var body: some View {
    ZStack {
      Color.gray200
        .ignoresSafeArea(.all)
      ScrollView(.vertical) {
        VStack(alignment: .leading) {
          Spacer().frame(height: 8)
          Image("Terms_backButton")
            .resizable()
            .frame(width: 8, height: 16)
            .padding(.leading, 8)
          Spacer().frame(height: 32)
          Text("최근 업데이트")
            .font(.pretendard(.semiBold, size: 26))
            .padding(.leading, 11)
          Spacer().frame(height: 30)
          LazyVGrid(columns: columns, spacing: 27) {
            ForEach((0...5), id: \.self ) {_ in
              ExploreCardViewCell()
            }
          }
        }
        .padding([.leading, .trailing], 17)
      }
    }
    .navigationBarBackButtonHidden(true)
    .toolbar(.hidden, for: .tabBar)
  }
}
  

struct RecentUpdateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecentUpdateDetailView()
    }
}
