//
//  tipKitView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/12.
//

import SwiftUI

struct TipKitView: View {
  @State private var isHidden = false
  var body: some View {
    if !isHidden {
      ZStack(alignment: .leading) {
        Image("tipKit")
          .resizable()
          .frame(width: 181, height: 34)
        HStack(alignment: .bottom) {
          Text("놓치기 아쉬운 활동은 찜해놓기!")
            .font(.pretendard(.medium, size: 12))
            .padding([.top, .leading], 8)
          Button {
            isHidden = true
          } label : {
            Image(systemName: "xmark")
              .resizable()
              .frame(width: 6, height: 6)
              .padding(.bottom, 4)
          }
          .foregroundColor(.gray900)
        }
      }
    }
  }
}

struct tipKitView_Previews: PreviewProvider {
    static var previews: some View {
        TipKitView()
    }
}
