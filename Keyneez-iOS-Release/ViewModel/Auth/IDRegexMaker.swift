//
//  IDRegexMaker.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/2/23.
//

import Foundation

struct IDRegexMaker {
  
  static func verify(id inputString: String) -> Bool {
    let regexPattern = "^[가-힣a-zA-Z0-9]{2,6}$"
    guard let regex = try? NSRegularExpression(pattern: regexPattern, options: .anchorsMatchLines) else { return false }
    let matches = regex.matches(in: inputString, options: [], range: NSRange(location: 0, length: inputString.utf16.count))
    return matches.count > 0
  }
  
  static func isSpecialCharIn(id inputString: String) -> Bool {
    let regexPattern = "^[^!@#$%^&*(),.?\":{}|<>]*$"
    guard let regex = try? NSRegularExpression(pattern: regexPattern, options: .anchorsMatchLines) else { return false }
    let matches = regex.matches(in: inputString, options: [], range: NSRange(location: 0, length: inputString.utf16.count))
    return !(matches.count > 0)
  }
  
}
