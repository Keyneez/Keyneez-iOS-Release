//
//  LikeViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/07.
//

import SwiftUI

final class LikeViewModel: ViewModelable {
  @Published var items = makeCardItems()
  @Published var state: State
  @Published var likeSelectedCellNumber: Int = 0
  @Published var likeEditSelectedCellNumber: Int = 0
  
  init() {
    state = .isCompleted(false)
  }
  
  enum Action {
    case onTapCardCellButton(id: Int)
    case onTapDeleteButton
  }
  
  enum State {
    case isCompleted(Bool)
  }
  
  
  func action(_ action: Action) {
    switch action {
    case .onTapCardCellButton(let id):
      didTapCardCellButton(id: id)
    case .onTapDeleteButton:
      didTapDeleteButton()
    }
  }
}

extension LikeViewModel {
  
  private func didTapCardCellButton(id: Int) {
    items[id].checked.toggle()
    satisfiedToConfirm()
  }
  
  private func satisfiedToConfirm() {
    if items.filter({ $0.checked == true }).count >= 1 {
      state = .isCompleted(true)
    } else {
      state = .isCompleted(false)
    }
  }
  
  private func didTapDeleteButton() {
  }
  
}
