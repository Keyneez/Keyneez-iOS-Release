//
//  BirthRegexMaker.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/27/23.
//

import Foundation

struct BirthRegexMaker {
  static func veryify(birthDate: String) -> BirthDateState {
    if birthDate.count == 0 {
      return .default
    }
    var patterns = [
      1: #"^\d{1}$"#,
      2: #"^\d{2}$"#,
      3: #"^\d{2}([0-1])$"#,
      4: #"^\d{2}(0[1-9]|1[0-2])$"#,
      5: #"^\d{2}(0[1-9]|1[0-2])([0-3])$"#,
      6: #"^\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$"#
    ]
    guard let regexPattern  = patterns[birthDate.count] else {
      return .error
    }
    
    if let _ = birthDate.range(of: regexPattern, options: .regularExpression){
      if birthDate.count == 6 {
        return BirthDateState.available
      }
      return .default
    } else {
      return .error
    }
  }
}
