//
//  View+Extension.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/09.
//

import SwiftUI

extension View {
  func tagViewStyle(widthSize: CGFloat, heightSize: CGFloat, textCGFloat: CGFloat) -> some View {
    modifier(TagViewModifier(widthSize: widthSize, heightSize: heightSize, textCGFloat: textCGFloat))
  }
}
