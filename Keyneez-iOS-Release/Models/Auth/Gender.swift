//
//  Gender.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/27/23.
//

import Foundation

enum Gender: Int, CustomStringConvertible {
  case man
  case woman
  case none
  
  var description: String {
    switch self {
    case .man:
      return "남성"
    case .woman:
      return "여성"
    case .none:
      return ""
    }
  }
  
}
