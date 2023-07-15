//
//  UserManager.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/29/23.
//

import Foundation

enum SNSType: String {
  case KAKAO
  case APPLE
  case NONE
}

struct User {
  var nickName: String
  var email: String
  var gender: Gender
  var birth: String
  var snsType: SNSType
}

final class UserManager {
  
  static let shared = UserManager()
  private init() { }
  
  var accessToken: String?
  var refreshToken: String?
  var user: User?
  
}
