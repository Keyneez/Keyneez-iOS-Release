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
  
  private var mainViewModel = MainViewModel()
  
  init() {
    KakaoSDK.initSDK(appKey: "0501023316109643f5aaf664f5af0eef")
  }
  
    var body: some Scene {
      WindowGroup {
        ContentView(viewModel: mainViewModel)
          .onAppear{
            Task {
              await mainViewModel.refreshToken()
            }
          }

//          TabBarView()
      }
    }
    

  
  
}
