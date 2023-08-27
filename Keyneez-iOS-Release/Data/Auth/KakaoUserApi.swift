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
  func logoutWithKakaoAcount() async -> (Error?)
}

final class KakaoUserApi: KakaoUserApiProtocol {
  
  static let shared = KakaoUserApi()
  private init() { }

  static func isKakaoTalkLoginAvailable() -> Bool {
    return UserApi.isKakaoTalkLoginAvailable()
  }
  
  func kakaoIdToken() async -> String? {
    if Self.isKakaoTalkLoginAvailable() {
      return await loginWithKakaoTalk().0?.idToken
    }
    return await loginWithKakaoAccount().0?.idToken
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
  
  func logoutWithKakaoAcount() async -> (Error?) {
    await withCheckedContinuation({ continuation in
      UserApi.shared.logout { error in
        continuation.resume(returning: error)
      }
    })
  }
  
  func unlinkWithKakaoAccount() async -> (Error?) {
    await withCheckedContinuation({ continuation in
      UserApi.shared.unlink { error in
        continuation.resume(returning: error)
      }
    })
  }
  
}
