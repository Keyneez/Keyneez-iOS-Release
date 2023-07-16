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
  
  static func makeGender(keyword: String) -> Self {
    if keyword == "M" {
      return .man
    } else if keyword == "W" {
      return .woman
    }
    return .none
  }
  
  var keyword: String {
    switch self {
    case .man:
      return "M"
    case .woman:
      return "W"
    case .none:
      return "N"
    }
  }
  
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
