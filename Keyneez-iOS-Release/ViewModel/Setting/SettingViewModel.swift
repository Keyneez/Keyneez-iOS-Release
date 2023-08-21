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
  
  private var repository: OAuthRepositoryProtocol
  
  init() {
    repository = OAuthRepository()
  }
  
  func didTapLogoutWithApple() { // 분기처리가 필요해서 do - catch 문을 쓴 거고..
    
    Task {
//      await MainActor.run {
//        isLoading = true
//      }
      
      do {
        let logoutInfo = try await repository.signOutWithApple()
        print(logoutInfo) // print 안됨
        try logoutWithApple(with: logoutInfo)
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
  
  private func logoutWithApple(with logoutInfo: LogoutResponseDTO) throws { // with : input 을 가공해 output으로 넣어주는 키워드
    guard let data = logoutInfo.data else {
      return
    }
    
    UserManager.shared.updateAccessToken("")
    UserManager.shared.updateRefreshToken("")
  }
}
