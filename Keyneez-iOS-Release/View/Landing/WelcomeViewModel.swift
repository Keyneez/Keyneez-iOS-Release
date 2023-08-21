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
import Combine
import SwiftUI

enum WelcomeViewModelError: Error {
  case kakaoLoginNotAvailable
}

enum Page {
  case signup(viewModel: RegisterIDViewModel)
  case home
}

final class WelcomeViewModel: ObservableObject {
  
  @Published var nextPage: Page? = nil
  @Published var readyToNavigation = false
  @Published var isLoading = false
  @Published var error: Error?
  
  private var repository: OAuthRepositoryProtocol
  
  init() {
    repository = OAuthRepository()
  }
  
  func didTapAppleLogin() {
    Task {
      await MainActor.run {
        isLoading = true
      }
      do {
        let loginInfo = try await repository.signInWithApple()
        try login(with: loginInfo)
        await gotoHome()
      } catch(let e) {
        guard let idToken = await AppleLoginManager.shared.performAppleSignIn() else {
          self.error = e
          return
        }
        await gotoSignup(with: idToken)
      }
    }
  }
  
  func didTapLoginWithKakao() {
    
    Task {
      await MainActor.run {
        isLoading = true
      }
      
      do {
        let loginInfo = try await repository.signInWithKakao()
        try login(with: loginInfo)
        await gotoHome()
      } catch(let e) {
        guard let idToken = await KakaoUserApi.shared.kakaoIdToken() else {
          self.error = e
          return
        }
        await gotoSignup(with: idToken)
      }
    }
    
  }
  
}

extension WelcomeViewModel {
  
  private func gotoSignup(with idToken: String) async {
    await MainActor.run {
      nextPage = .signup(viewModel: RegisterIDViewModel(idToken: idToken))
      readyToNavigation = true
      isLoading = false
    }
  }
  
  private func gotoHome() async {
    await MainActor.run {
      nextPage = .home
      readyToNavigation = true
      isLoading = false
    }
  }
  
  private func login(with loginInfo: LoginResponseDTO) throws {
    guard let accessToken = loginInfo.token?.accessToken, let refreshToken = loginInfo.token?.refreshToken else {
      return
    }
    
    UserManager.shared.updateAccessToken(accessToken)
    
    UserManager.shared.updateRefreshToken(refreshToken)
    
    do {
      guard let userInfo = loginInfo.user else { return }
      let user = try userInfo.toDomain()
      UserManager.shared.updateUser(with: user)
    } catch(let e){
      self.error = e
      return
    }
  }
  
  
}
