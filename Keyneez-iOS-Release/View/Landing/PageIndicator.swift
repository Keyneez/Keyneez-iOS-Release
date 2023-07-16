//
//  PageIndicator.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/27/23.
//

import SwiftUI
import UIKit

struct PageIndicator: UIViewRepresentable {
  
  @Binding var currentPage: Int
  var numberOfpages: Int
  var indicatorImage: String = ""
  
  func makeUIView(context: Context) -> some UIView {
    let control = UIPageControl()
    control.numberOfPages = 1
    return control
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {
    guard let control = uiView as? UIPageControl else { return }
    control.currentPage = currentPage
    control.numberOfPages = numberOfpages
  }
  
}
