//
//  NicknameState.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/1/23.
//

import SwiftUI

enum NicknameState: CustomStringConvertible {
  case `default`
  case available
  case specialSymbol
  case duplicated
  
  var description: String {
    switch self {
    case .`default`:
      return "2~6자로 한글, 영문, 숫자 조합해 사용할 수 있어요."
    case .available:
      return "사용 가능한 닉네임이에요."
    case .specialSymbol:
      return "특수문자를 사용할 수 없어요"
    case .duplicated:
      return "중복된 닉네임입니다."
    }
  }
  
  var color: Color {
    switch self {
    case .`default`: return Color(.systemGray4)
    case .available:
      return Color(.systemGray5)
    case .specialSymbol:
      return .red
    case .duplicated:
      return .red
    }
  }
}
