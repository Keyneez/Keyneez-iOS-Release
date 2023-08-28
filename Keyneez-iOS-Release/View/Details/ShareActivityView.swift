//
//  ShareActivityView.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/08/26.
//

import UIKit
import SwiftUI

struct ShareActivityView: UIViewControllerRepresentable {
  let text: String
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<ShareActivityView>) -> UIActivityViewController {
    return UIActivityViewController(activityItems: [text], applicationActivities: nil)
  }
  
  func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ShareActivityView>) {}
}
