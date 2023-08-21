//
//  RecentUpdateDetailView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/13.
//

import SwiftUI

struct RecentUpdateDetailView: View {
  @Environment(\.dismiss) private var dismiss

  var columns: [GridItem] = [
         GridItem(.flexible(), spacing: 19), // 가로 간격 설정
         GridItem(.flexible())
     ]
  @StateObject private var viewModel = AllCardViewModel()

  var body: some View {
    ZStack {
      Color.gray200
        .ignoresSafeArea(.all)
      ScrollView(.vertical) {
        VStack(alignment: .leading) {
          Spacer().frame(height: 8)
          Button {
            dismiss()
          } label: {
            Image("Terms_backButton")
              .resizable()
              .frame(width: 8, height: 16)
              .padding(.leading, 8)
          }
          Spacer().frame(height: 32)
          Text("최근 업데이트")
            .font(.pretendard(.semiBold, size: 26))
            .padding(.leading, 11)
          Spacer().frame(height: 30)
          LazyVGrid(columns: columns, spacing: 27) {
            ForEach(viewModel.allCardList, id: \.contentPk ) {content in
              ExploreCardViewCell(model: content)
            }
          }
        }
        .padding(.horizontal, 17)
      }
    }
    .navigationBarBackButtonHidden(true)
    .toolbar(.hidden, for: .tabBar)
    .onAppear {
      viewModel.fetchAllCard()
    }
  }
}
