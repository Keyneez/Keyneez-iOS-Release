//
//  RegisterConsentViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/2/23.
//

import Foundation
import Combine

final class RegisterConsentViewModel: ViewModelable {
  
  // MARK: - Opt-in Consent
  @Published var userAgeOver14: Bool = false
  @Published var consentOfUsingService: Bool = false
  @Published var consentOfCollectingPrivacy: Bool = false
  
  // MARK: - Opt-out Consent
  @Published var consentOfPromotion: Bool = false
  
  @Published var state: State
  
  var consentValidation: AnyPublisher<Bool, Never> {
    return $userAgeOver14.combineLatest($consentOfUsingService, $consentOfCollectingPrivacy) {
      return ($0 == true && $1 == true && $2 == true)
    }
    .eraseToAnyPublisher()
  }
  
  enum Action {
    case onTapUserAgeOver14
    case onTapconsentOfUsingService
    case onTapconsentOfCollectingPrivacy
    case onTapconsentOfPromotion
  }
  
  enum State {
    case confirm(Bool)
  }
  
  init() {
    state = .confirm(false)
  }
  
  func action(_ action: Action) {
    switch action {
    case .onTapUserAgeOver14:
      userAgeOver14 = !userAgeOver14
    case .onTapconsentOfUsingService:
      consentOfUsingService = !consentOfPromotion
    case .onTapconsentOfCollectingPrivacy:
      consentOfCollectingPrivacy = !consentOfCollectingPrivacy
    case .onTapconsentOfPromotion:
      
      consentOfPromotion = !consentOfPromotion
    }
  }
  
}
