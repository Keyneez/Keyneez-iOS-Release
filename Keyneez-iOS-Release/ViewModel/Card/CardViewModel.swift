//
//  CardViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/07.
//

import SwiftUI

class CardViewModel : ObservableObject {
  @Published var isClickedLike = false
  
  func toggleLike() {
    isClickedLike.toggle()
  }
}
