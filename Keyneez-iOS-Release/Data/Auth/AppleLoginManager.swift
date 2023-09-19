//
//  AppleLoginManager.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 7/16/23.
//

import Foundation
import AuthenticationServices

final class AppleLoginManager: NSObject, ASAuthorizationControllerDelegate {
  
  static let shared = AppleLoginManager()
  
  private override init() {
    super.init()
  }
  
  private var completion: ((_ token: String?) -> ())?
  
  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    if let appleIdCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
      guard let token = appleIdCredential.identityToken?.base64EncodedString(), let authCode = appleIdCredential.authorizationCode?.base64EncodedString() else {
        completion?(nil)
        return }
      completion?(token)
    }
  }
  
  func performAppleSignIn() async -> String? {
    await withCheckedContinuation({ continuation in
      self.performAppleSignIn { token in
        continuation.resume(returning: token)
      }
    })
  }
  
  func performAppleLogout() async -> Bool? {
    await withUnsafeContinuation({ continuation in
      self.performAppleLogout { success in
        continuation.resume(returning: success)
      }
    })
  }

  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    // 로그아웃 중 오류가 발생했을 때의 처리
    print("Apple 로그아웃 중 오류 발생: \(error.localizedDescription)")
  }
  
}

extension AppleLoginManager {
  
  private func performAppleSignIn(with completion: @escaping (_ token: String?) -> ()) {
    self.completion = completion
    let provider = ASAuthorizationAppleIDProvider()
    let request = provider.createRequest()
    request.requestedScopes = [.fullName, .email]
    let controller = ASAuthorizationController(authorizationRequests: [request])
    controller.delegate = self
    controller.performRequests()
  }
  
  private func performAppleLogout(with completion: @escaping (_ success: Bool?) -> ()) {
    let authorization = ASAuthorizationAppleIDProvider()
    let request = authorization.createRequest()
    request.requestedOperation = .operationLogout
    
    let controller = ASAuthorizationController(authorizationRequests: [request])
    controller.delegate = self
    controller.performRequests()
  }
  
}



