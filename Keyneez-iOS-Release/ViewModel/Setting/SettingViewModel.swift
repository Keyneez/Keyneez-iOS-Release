//
//  SettingViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/06/21.
//

import SwiftUI

final class SettingViewModel: ObservableObject {
  
  @Published var readyToNavigation = false
  @Published var isLoading = false
  @Published var error: Error?
  
  private var repository: OAuthRepositoryProtocol
  
  init() {
    repository = OAuthRepository()
  }
  
  func logout() { // 분기처리가 필요해서 do - catch 문을 쓴 거고..
    Task {
      do {
        let logoutInfo = try await repository.logoutAuth()
        try logout(with: logoutInfo)
        await gotoWelcome() // 로그아웃하고 되면 첫화면으로 돌아가기
      } catch (let e) { // 로그아웃하고 안 되면
        self.error = e
        return
      }
    }
  }
  
  
  func checkSnsType() -> SNSType {
    return UserManager.shared.user?.snsType ?? .NONE
  }
}

extension SettingViewModel {
  
  private func gotoWelcome() async {
    await MainActor.run {
      // welcomeView로 돌아가기
      readyToNavigation = true
      isLoading = false
    }
  }
  
  private func logout(with logoutInfo: LogoutResponseDTO) throws {
    guard let data = logoutInfo.data else {
      return
    }
    
    UserManager.shared.updateAccessToken("")
    
    UserManager.shared.updateRefreshToken("")

  }
}
