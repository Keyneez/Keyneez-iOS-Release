//
//  View+Extension.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/5/23.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
  
  func calculateTotalHeight(itemCount: Int, itemHeight: CGFloat, spacing: CGFloat) -> CGFloat {
    if itemCount != 0 {
      let dividedItemCount = CGFloat(itemCount) / 2
      let roundedDividedItemCount = ceil(dividedItemCount)
      let totalHeight = roundedDividedItemCount * (itemHeight + spacing)
      return totalHeight
    }
    return 0
  }
  
  func tagViewStyle(widthSize: CGFloat, heightSize: CGFloat, textCGFloat: CGFloat) -> some View {
    modifier(TagViewModifier(widthSize: widthSize, heightSize: heightSize, textCGFloat: textCGFloat))
  }
}
