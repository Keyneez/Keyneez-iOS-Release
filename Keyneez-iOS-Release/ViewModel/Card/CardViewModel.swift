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
  
  func calculateTotalHeight(itemHeight: CGFloat, spacing: CGFloat) -> CGFloat {
    let itemCount = items.count
    let dividedItemCount = CGFloat(itemCount) / 2
    let roundedDividedItemCount = ceil(dividedItemCount)
    let totalHeight = roundedDividedItemCount * itemHeight + CGFloat(itemCount - 1) * spacing
    return totalHeight
    
  }
}
  
