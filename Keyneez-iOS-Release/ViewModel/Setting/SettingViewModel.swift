//
//  SettingViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/06/21.
//

import SwiftUI

final class SettingViewModel: ObservableObject {
  
  @Published var nextPage: Page? = nil
  @Published var readyToNavigation = false
  @Published var isLoading = false
  @Published var error: Error?
  @Published var appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
  @Published var userName = UserManager.shared.user?.nickName
  
  private var repository: OAuthRepositoryProtocol
  
  init() {
    repository = OAuthRepository()
  }
  
  func didTapLogoutWithApple() {
    Task {
      do {
        try await repository.signOutWithApple()
        await gotoHome() // 로그아웃 성공
      } catch(let e) { // 로그아웃 실패 ->
        self.error = e
        print("로그아웃 실패")
      }
    }
  }
  
  func didTapLogoutWithKakao() {
    Task { // 카카오 로그아웃은 되는데 서버 로그아웃 전달이 안 됨
      do {
        try await repository.signOutWithKakao()
        await gotoHome() // 로그아웃 성공
      } catch(let e) { // 로그아웃 실패 ->
        self.error = e
        print("로그아웃 실패")
      }
    }
  }
  
  func didTapWithdrawWithKakao() {
    Task {
      do {
        let logoutInfo = try await repository.withdrawWithKakao()
        print(logoutInfo) // print 안됨 - 여기서 문제
        await gotoHome() // 로그아웃 성공
      } catch(let e) { // 로그아웃 실패 ->
        self.error = e
        print("로그아웃 실패")
      }
    }
  }
  
  
  func checkSnsType() -> SNSType {
    return UserManager.shared.user?.snsType ?? .NONE
  }
}

extension SettingViewModel {
  
  private func gotoHome() async {
    await MainActor.run {
      nextPage = .home
      readyToNavigation = true
      isLoading = false
    }
  }
  
  private func gotoWelcome() async {
    await MainActor.run {
      // welcomeView로 돌아가기
      readyToNavigation = true
      isLoading = false
    }
  }
}
