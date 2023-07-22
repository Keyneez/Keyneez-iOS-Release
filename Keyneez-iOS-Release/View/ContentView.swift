//
//  ContentView.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 7/22/23.
//

import SwiftUI
import KakaoSDKAuth

struct ContentView: View {
  
  @StateObject var viewModel: MainViewModel

    var body: some View {
      switch viewModel.appFlow {
      case .Auth:
        goToLoginFlow()
      case .Home:
        TabBarView()
      case .Launching:
        Text("런칭중")
      }
    }
  
  @ViewBuilder
  private func goToLoginFlow() -> some View {
    RegisterContainerView()
      .onOpenURL { url in
        if AuthApi.isKakaoTalkLoginUrl(url) {
          _ = AuthController.handleOpenUrl(url: url)
        }
      }
  }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView(viewModel: MainViewModel())
    }
}
