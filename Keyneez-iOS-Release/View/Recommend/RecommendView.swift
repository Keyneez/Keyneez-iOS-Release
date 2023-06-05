//
//  RecommendView.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/5/23.
//

import SwiftUI



struct RecommendView: View {
  private var items: [RecommendItem] = makeRecommendItems()
  
  private let gridLayout = [
    GridItem(.flexible(), spacing: 15),
    GridItem(.flexible(), spacing: 15)
  ]
  
    var body: some View {
      VStack {
        VStack(alignment: .leading) {
          Text("민지너는최고님께\n딱 맞는 정보를 추천해 드릴게요!")
            .font(.system(size: 24, weight: .bold))
          Spacer().frame(height: 24 * 3/4)
          Text("선호하는 카테고리를 최대 3개까지 골라주세요")
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.gray)
          Spacer().frame(height: 30 * 3/4)
          LazyVGrid(columns: gridLayout, spacing: 15) {
            ForEach(items, id: \.self) {
              item in
                ZStack(alignment: .topLeading) {
                  Rectangle()
                    .foregroundColor(.red)
                    
                  RecommendCell(item: item)
                }
                  .frame(maxWidth: .infinity, minHeight: 144)
                  .cornerRadius(30)
            }
          }
        }
        .padding(.horizontal, 24)
        Spacer()
        Button(action: { }) {
          Text("키니즈 시작하기")
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(17 * 3/4)
        }
        .buttonStyle(.borderedProminent)
//        .tint(isNicknameAvailable())
        .padding(.horizontal, 22)
      }
    }
}

struct RecommendView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendView()
    }
}
