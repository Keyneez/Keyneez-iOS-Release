//
//  MainViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 7/22/23.
//

import Foundation

enum AppFlow {
  case Auth
  case Home
  case Launching
}

final class MainViewModel: ObservableObject {
  
  @Published var appFlow: AppFlow = .Launching
  
  init() { }
  
  @MainActor
  func refreshToken() async {
    
    guard let accessToken = UserManager.shared.accessToken, let refreshToken = UserManager.shared.refreshToken else {
      self.appFlow = .Auth
      return
    }
    
    do {
      let result = try await AuthRemoteManager.shared.refresh(accessToken: accessToken, refreshToken: refreshToken)
      guard let newAccessToken = result.accessToken else { return }
      UserManager.shared.updateAccessToken(newAccessToken)
      self.appFlow = .Home
    } catch(let e) {
      self.appFlow = .Auth
    }
  }
  
}
