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
    AppleLoginManager.shared.performAppleSignIn { [weak self] token, userIdentifier, name, email in
      guard let self else { return }
      Task {
        let response = try await self.repository.signUpWithApple(with: token)
        //TODO: apple Login 처리
      }
    }
  }

  func didTapLoginWithKakao() {
    do {
      Task {
        await MainActor.run {
          isLoading = true
        }
        let responseAndToken = try await repository.loginWithKakao()
        _ = responseAndToken.dto
        
        let idToken = responseAndToken.idToken
        let kakaoAccessToken = responseAndToken.accessToken
        
        await MainActor.run {
          nextPage = .signup(viewModel: RegisterIDViewModel(idToken: idToken, kakaoAccessToken: kakaoAccessToken))
          readyToNavigation = true
          isLoading = false
        }
      }
    }
    catch(let error){
      self.error = error
    }
    
  }

}
