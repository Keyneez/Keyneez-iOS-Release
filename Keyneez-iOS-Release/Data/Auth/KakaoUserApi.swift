//
//  KakaoUserApi.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/29/23.
//

import Foundation
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKCommon

protocol KakaoUserApiProtocol {
  static func isKakaoTalkLoginAvailable() -> Bool
  func loginWithKakaoAccount() async -> (OAuthToken?, Error?)
  func loginWithKakaoTalk() async -> (OAuthToken?, Error?)
}

final class KakaoUserApi: KakaoUserApiProtocol {
  
  static let shared = KakaoUserApi()
  private init() { }

  static func isKakaoTalkLoginAvailable() -> Bool {
    return UserApi.isKakaoTalkLoginAvailable()
  }
  
  func loginWithKakaoTalk() async -> (OAuthToken?, Error?) {
    await withCheckedContinuation({ continuation in
      UserApi.shared.loginWithKakaoTalk { oauthToken, error in
        continuation.resume(returning: (oauthToken, error))
      }
    })
  }
  
  func loginWithKakaoAccount() async -> (
    OAuthToken?, Error?) {
      await withCheckedContinuation({ continuation in
        UserApi.shared.loginWithKakaoAccount { oauthtoken, error in
          continuation.resume(returning: (oauthtoken, error))
        }
      })
  }
  

  
  
}
