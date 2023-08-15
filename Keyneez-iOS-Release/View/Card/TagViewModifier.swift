//
//  TagView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/06/27.
//

import SwiftUI

struct TagViewModifier : ViewModifier {
  var widthSize : CGFloat
  var heightSize : CGFloat
  var textCGFloat : CGFloat
  @State var textCGSize: CGSize = .zero

  func body(content: Content) -> some View {
    ZStack(alignment: .center) {
      Rectangle()
        .cornerRadius(53)
        .frame(width: textCGSize.width + widthSize, height: textCGSize.height + heightSize)
      
      content
        .foregroundColor(.gray050)
        .font(.pretendard(.medium, size: textCGFloat))
        .background(
          //Text background 사이즈 송신
          GeometryReader { geometry in
            Color.clear
              .preference(
                key: SizePreferenceKey.self,
                value: geometry.size
              )
          }
        )
      //Text background 사이즈 수신
        .onPreferenceChange(SizePreferenceKey.self) { textCGSize = $0 }
    }
  }
}

struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
    let newSize = nextValue()
    value = CGSize(
      width: newSize.width,
      height: newSize.height
      
    )
  }
}

