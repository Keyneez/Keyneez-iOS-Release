//
//  ConsentROw.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/2/23.
//

import SwiftUI

struct ConsentRow: View {
  var content: ConsentContent
  
  var body: some View {
    HStack {
      Button(action: {}) {
        Image("unchecked")
      }
      Spacer().frame(width: 22)
      Text(content.consentText).font(.system(size: 16))
      Spacer()
      Button(action: {}) {
        Image(systemName: "chevron.right").renderingMode(.template)
          .tint(.black)
      }
      .opacity(content.detailURL == nil ? 0: 1)
    }
  }
}
