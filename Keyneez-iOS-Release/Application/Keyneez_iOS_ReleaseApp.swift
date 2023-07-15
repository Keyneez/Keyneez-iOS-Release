//
//  Keyneez_iOS_ReleaseApp.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/05/25.
//

import SwiftUI
import KakaoSDKAuth
import KakaoSDKCommon

@main
struct Keyneez_iOS_ReleaseApp: App {
  
  init() {
    KakaoSDK.initSDK(appKey: "0501023316109643f5aaf664f5af0eef")
  }
  
    var body: some Scene {
        WindowGroup {
          // kakaoLogin
//          RegisterContainerView()
          WelcomeView(viewModel: WelcomeViewModel())
            .onOpenURL { url in
              if AuthApi.isKakaoTalkLoginUrl(url) {
                _ = AuthController.handleOpenUrl(url: url)
              }
            }
//          RegisterContainerView()
        }
    }
}
