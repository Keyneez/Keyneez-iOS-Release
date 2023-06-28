//
//  BirthDateStae.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/27/23.
//

import SwiftUI

enum BirthDateState {
  case `default`
  case available
  case error
  
  var color: Color {
    switch self {
    case .`default`, .available:
      return Color(.systemGray4)
    case .error:
      return .red
    }
  }
}
