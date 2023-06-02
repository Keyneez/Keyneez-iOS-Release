//
//  RegisterIDViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/2/23.
//

import Foundation

final class RegisterIDViewModel: ObservableObject {
  
  @Published var nickName: String = "" {
    didSet {
      updateNickNameState(by: nickName)
    }
  }
  @Published var nickNameState: NicknameState = .default
  
  private func updateNickNameState(by nickName: String) {
    if (IDRegexMaker.verify(id: nickName) == true) {
      nickNameState = .available
    } else {
      if IDRegexMaker.isSpecialCharIn(id: nickName) == true {
        nickNameState = .specialSymbol
      } else {
        nickNameState = .default
      }
    }
  }
  
}


