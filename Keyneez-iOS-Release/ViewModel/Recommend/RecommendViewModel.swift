//
//  RecommendViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/18/23.
//

import Foundation

final class RecommendViewModel: ViewModelable {
  
  let queueLimit = 3
  @Published var state: State
  @Published var items = makeRecommendItems()
  @Published var nickname: String = "민지너는최고"
  @Published var confirmed: Bool = false
  @Published var error: Error?
  
  private var idToken: String?
  private var gender: Gender = .none
  private var birth: String
  private var repository: OAuthRepositoryProtocol = OAuthRepository()
  
  init(idToken: String?, nickname: String, gender: Gender, birth: String) {
    self.idToken = idToken
    self.gender = gender
    self.birth = birth
    self.nickname = nickname
    state = .isCompleted(false)
  }
  
  enum Action {
    case onTapFilter(id: Int)
    case onTapConfirmButton
  }
  
  enum State {
    case isCompleted(Bool)
  }
  
  func action(_ action: Action) {
    switch action {
    case .onTapFilter(let id):
      didTapFliterButton(id: id)
    case .onTapConfirmButton:
      Task {
        let isSignUpSuccessed = await signUp()
        await MainActor.run {
          confirmed = isSignUpSuccessed
        }
      }
    }
  }

  
  
  
  private func signUp() async -> Bool {
    
    guard let idToken = idToken else { return false }
    do {
      let signUpResponse = try await repository.signUpWithKakao(with: KakaoSignUpRequestDTO(idToken:idToken, nickname: nickname, gender: gender.keyword, birth: birth, age: 0, tagPks: items.filter { $0.checked == true }.map { $0.id }))
      
      guard let accessToken = signUpResponse.token?.accessToken, let refreshToken = signUpResponse.token?.refreshToken else {
        return false
      }
      UserManager.shared.updateAccessToken(accessToken)
      UserManager.shared.updateRefreshToken(refreshToken)
      
      do {
        guard let userInfo = signUpResponse.user else { return false }
        let user = try userInfo.toDomain()
        UserManager.shared.updateUser(with: user)
      } catch(let e){
        self.error = e
        return false
      }
      
      return true
    } catch(let e) {
      await MainActor.run {
        error = e
      }
    }
    return false
  }
  
}

extension RecommendViewModel {
  
  private func isExceedLimit() -> Bool {
    return items.filter { $0.checked == true }.count >= queueLimit
  }
  
  private func didTapFliterButton(id: Int) {
    if !isExceedLimit() {
      items[id].checked = !items[id].checked
    } else {
      if items[id].checked == true {
        items[id].checked = !items[id].checked
      }
    }
    satisfiedToConfirm()
  }
  
  private func satisfiedToConfirm() {
    if items.filter({ $0.checked == true }).count == queueLimit {
      state = .isCompleted(true)
    } else {
      state = .isCompleted(false)
    }
  }
  
  private func saveUserInfo(user: UserDTO?) {
    
    guard let user = user else {
      return
    }
    
    do {
      var userEntity = try user.toDomain()
      UserManager.shared.user = userEntity
    } catch(let e) {
      print(e)
    }
    
  }
  
  private func saveTokensInKeychain(tokens: Token?) {
    
    guard let accessToken = tokens?.accessToken, let refreshToken = tokens?.refreshToken else { return }
    
    KeyChainManager.shared.saveInKeychain(account: "accessToken", value: accessToken)
    KeyChainManager.shared.saveInKeychain(account:  "refreshToken", value: refreshToken)
    
  }
  
}
