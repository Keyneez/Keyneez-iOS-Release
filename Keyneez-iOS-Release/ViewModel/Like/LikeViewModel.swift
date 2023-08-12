//
//  LikeViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/07.
//

import SwiftUI

final class LikeViewModel: ViewModelable {
    let queueLimit = 1
    @Published var items = makeCardItems()
    @Published var state: State
    @Published var likeSelectedCellNumber: Int = 0
    @Published var likeEditSelectedCellNumber: Int = 0
    
    init() {
        state = .isCompleted(false)
    }
    
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
        Task {
    
          }
        }
      }
    }
    
extension LikeViewModel {
    
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

}
