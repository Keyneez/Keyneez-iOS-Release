//
//  RecommendViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/18/23.
//

import Foundation

final class RecommendViewModel: ViewModelable {
  
  let queueLimit = 3
  @Published var state: State
  @Published var items = makeRecommendItems()
  
  enum Action {
    case onTapFilter(id: Int)
    case onTapConfirmButton
  }
  
  enum State {
    case isCompleted(Bool)
  }
  
  func action(_ action: Action) {
    switch action {
    case .onTapFilter(let id):
      didTapFliterButton(id: id)
    case .onTapConfirmButton:
      confirmed()
    }
  }
  
  init() {
    self.state = .isCompleted(false)
  }
  
  private func isExceedLimit() -> Bool {
    return items.filter { $0.checked == true }.count >= queueLimit
  }
  
  private func didTapFliterButton(id: Int) {
    if !isExceedLimit() {
      items[id].checked = !items[id].checked
    } else {
      if items[id].checked == true {
        items[id].checked = !items[id].checked
      }
    }
    satisfiedToConfirm()
  }
  
  private func satisfiedToConfirm() {
    if items.filter({ $0.checked == true }).count == queueLimit {
      state = .isCompleted(true)
    } else {
      state = .isCompleted(false)
    }
  }
  
  private func confirmed() {
    
  }
  
}
