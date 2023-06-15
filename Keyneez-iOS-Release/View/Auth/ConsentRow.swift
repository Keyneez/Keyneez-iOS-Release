//
//  ConsentROw.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/2/23.
//

import SwiftUI

struct ConsentRow: View {
  var content: ConsentContent
  @ObservedObject var viewModel: RegisterConsentViewModel
  
  var body: some View {
    HStack {
      Button(action: {
        print(viewModel.consents)
      }) {
        if !viewModel.consents[content.content.rawValue] {
          Image("unchecked")
        } else {
          Image("checked")
        }
        
      }
      Spacer().frame(width: 22)
      Text(content.content.description).font(.system(size: 16))
      Spacer()
      Button(action: {}) {
        Image(systemName: "chevron.right").renderingMode(.template)
          .tint(.black)
      }
      .opacity(content.content.URL == nil ? 0: 1)
    }
  }
}
