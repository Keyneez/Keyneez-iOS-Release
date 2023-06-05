//
//  TagView.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/5/23.
//

import SwiftUI

struct RoundedCorner: Shape {
  var radius: CGFloat = .infinity
  var corners: UIRectCorner = .allCorners
  
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect, cornerRadius: radius)
    return Path(path.cgPath)
  }
}

struct TagView: View {
  var tag: Tag = .activity
  var body: some View {
    Text(tag.description)
      .foregroundColor(.white)
      .padding(.horizontal, 8.5)
      .padding(.vertical, 4)
      .background(tag.color)
      .cornerRadius(.infinity, corners: .allCorners)
  }
}
