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
  
  private var completion: ((_ token: String, _ userIdentifier: String, _ fullName: String?, _ email: String?) -> ())?
  
  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    if let appleIdCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
      guard let token = appleIdCredential.identityToken?.base64EncodedString() else { return }
      let userIdentifier = appleIdCredential.user
      let fullName = appleIdCredential.fullName?.description
      let email = appleIdCredential.email
      completion?(token, userIdentifier, fullName, email)
    }
  }
  
  func performAppleSignIn(with completion: @escaping (_ token: String, _ userIdentifier: String, _ fullName: String?, _ email: String?) -> ()) {
    self.completion = completion
    let provider = ASAuthorizationAppleIDProvider()
    let request = provider.createRequest()
    request.requestedScopes = [.fullName, .email]
    let controller = ASAuthorizationController(authorizationRequests: [request])
    controller.delegate = self
    controller.performRequests()
  }
  
}



