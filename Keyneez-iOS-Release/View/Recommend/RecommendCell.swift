//
//  RecommendCell.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/5/23.
//

import SwiftUI

struct RecommendCell: View {
  
  var item: RecommendItem
  var body: some View {
    ZStack {
      VStack(alignment: .leading) {
        Spacer().frame(height: 29)
        TagView(tag: item.tag)
        Text(item.text)
          .font(.system(size: 16, weight: .bold))
      }
      .padding(.leading, 17)
    }
  }
  
}
