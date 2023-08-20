//
//  CardViewCell.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/06/23.
//

import SwiftUI

struct HomeCardCell: View {
  @State private var heart: Bool = false
  let model: DetailContentResponseDTO

  var body: some View {
    GeometryReader { geo in
      Color.white
      VStack(alignment: .leading) {
        Spacer().frame(height: 16)
        HStack {
          Text(model.category)
            .tagViewStyle(widthSize: 7, heightSize: 3.5, textCGFloat: 10)
            .foregroundColor(Color.categoryColor(for: model.category))
          Spacer()
          Button {
            heart.toggle()
          } label: {
            heart ? Image("ic_heart_on") : Image("ic_heart_off")
          }
        }
        Spacer().frame(height: 9)
        Text(model.title)
          .font(.pretendard(.bold, size: 14))
          .foregroundColor(.gray900)
        Spacer().frame(height: 6)
        Text("\(model.startAt ?? "") - \(model.endAt ?? "")")
          .font(.pretendard(.medium, size: 8))
          .foregroundColor(.gray400)
        Spacer().frame(height: 9)
        Image("hobby")
          .resizable()
          .frame(width: 110, height: 110)
      }
      .padding(.horizontal,14)
      
    }
    .frame(width: 141, height: 220)
    .cornerRadius(14)
    
  }
}


