//
//  LikeViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/29.
//

import Foundation
import SwiftUI

final class LikeViewModel: ViewModelable {
  @Published var likeSelectedButton: FilterTagType = .all
  @Published var state: State
  @Published var selectedContentPks: Set<Int> = []
  
  init() {
    state = .isCompleted(false)
  }
  
  enum Action {
    case onTapCardCellButton(pk: Int)
    case onTapDeleteButton
  }
  
  enum State {
    case isCompleted(Bool)
  }
  
  
  func action(_ action: Action) {
    switch action {
    case .onTapCardCellButton(let pk):
      didTapCardCellButton(pk)
    case .onTapDeleteButton:
      didTapDeleteButton()
    }
  }
}

extension LikeViewModel {
  
  private func didTapCardCellButton(_ contentPk: Int) {
    if selectedContentPks.contains(contentPk) {
      selectedContentPks.remove(contentPk)
    } else {
      selectedContentPks.insert(contentPk)
    }
    print("@newLog \(selectedContentPks), \(selectedContentPks.count)")
    satisfiedToConfirm()
  }
  
  private func satisfiedToConfirm() {
    if selectedContentPks.count > 0 {
      state = .isCompleted(true)
    } else {
      state = .isCompleted(false)
    }
  }
  
  private func didTapDeleteButton() {
  }
  
}

