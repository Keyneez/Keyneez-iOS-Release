//
//  SignUpRequestDTO.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/29/23.
//

import Foundation

struct SignUpRequestDTO: Codable {
  var idToken: String
  var accessToken: String
  var nickname: String
  var gender: String
  var birth: String
  var age: Int
  var tagPks: [Int]
}
