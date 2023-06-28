//
//  WelcomViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/28/23.
//

import Foundation
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon

final class WelcomeViewModel {
  
  func loginWithKakao() {
    
    if UserApi.isKakaoTalkLoginAvailable() {
      UserApi.shared.loginWithKakaoTalk { token, error in
        // kakao 토큰 서버로 전달
      }
    } else {
      UserApi.shared.loginWithKakaoAccount { token, error in
        // kakao Token 서버로 전달
      }
      
    }
  }
  
  
}
