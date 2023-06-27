//
//  RegisterIDViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/2/23.
//

import Foundation
import Combine

final class RegisterIDViewModel: ViewModelable {
  
  @Published var nickName: String = ""
  @Published var nickNameState: NicknameState = .default
  @Published var birthDate: String = ""
  @Published var birthDateState: BirthDateState = .default
  @Published var gender: Gender = .none
  @Published var state: State
  var cancelBag = [AnyCancellable]()
  
  enum Action {
    case onTapGenderButton(gender: Gender)
    case onTapNextButton
  }
  
  
  enum State {
    case confirm(Bool)
  }
  
  init() {
    state = .confirm(false)
    updateNickNameState()
    updateBirthDateState()
    validateConfirm()
  }
  
  func action(_ action: Action) {
    switch action {
    case .onTapGenderButton(let gender):
      self.gender = gender
    case .onTapNextButton:
      return
    }
  }
  
  private func validateConfirm() {
    $nickNameState.combineLatest($birthDateState, $gender) {
      return $0 == .available && $1 == .available && $2 != .none
    }
    .sink { [weak self] ok in
      self?.state = .confirm(ok)
    }
    .store(in: &self.cancelBag)
  }
  
  private func updateBirthDateState() {
    $birthDate
      .map {
        BirthRegexMaker.veryify(birthDate: $0)
      }
      .assign(to: &$birthDateState)
  }
  
  private func updateNickNameState() {
    $nickName
      .map {
        if (IDRegexMaker.verify(id: $0) == true) {
          return NicknameState.available
        } else {
          if IDRegexMaker.isSpecialCharIn(id: $0) == true {
            return .specialSymbol
          } else if $0.count > 6 {
            return .overSix
          } else {
            return .default
          }
        }
      }
      .assign(to: &$nickNameState)
  }
  
}


