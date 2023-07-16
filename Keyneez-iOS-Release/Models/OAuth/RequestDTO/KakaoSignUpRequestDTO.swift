//
//  KakaoSignUpRequestDTO.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/28/23.
//

import Foundation

struct KakaoSignUpRequestDTO: Codable {
  var idToken: String
  var accessToken: String
  var nickname: String
  var gender: String
  var birth: String
  var age: Int
  var tagPks: [Int]
}
