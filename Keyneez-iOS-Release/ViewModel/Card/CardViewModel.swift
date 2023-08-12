//
//  CardViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/07.
//

import SwiftUI

class CardViewModel : ObservableObject {
  @Published var items = makeCardItems()
  
  func toggleHeart(for item: CardItem) {
    if let index = items.firstIndex(of: item) {
      items[index].heart.toggle()
    }
  }
  
  
}

