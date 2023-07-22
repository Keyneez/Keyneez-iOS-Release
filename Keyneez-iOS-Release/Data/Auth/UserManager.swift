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
  private init() {
    self.accessToken = KeyChainManager.shared.loadFromKeychain(account: TokenType.accessToken.rawValue)
    self.refreshToken = KeyChainManager.shared.loadFromKeychain(account: TokenType.refreshToken.rawValue)
  }
  
  private(set) var accessToken: String?
  private(set) var refreshToken: String?
  var user: User?
  
  
  func updateAccessToken(_ accessToken: String) {
    self.accessToken = accessToken
    KeyChainManager.shared.saveInKeychain(account: TokenType.accessToken.rawValue, value: accessToken)
  }
  
  func updateRefreshToken(_ refreshToken: String) {
    self.accessToken = refreshToken
    KeyChainManager.shared.saveInKeychain(account: TokenType.refreshToken.rawValue, value: refreshToken)
  }
  
  func updateUser(with user: User) {
    self.user = user
  }
  
  
}
