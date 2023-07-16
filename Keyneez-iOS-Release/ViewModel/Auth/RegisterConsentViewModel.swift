//
//  RegisterConsentViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/2/23.
//

import Foundation
import Combine

enum Constent: Int, CustomStringConvertible, CaseIterable {
  case UserAgeOver14
  case ConsentOfUsingService
  case ConsentOfCollectingPrivacy
  case ConsentOfPromotion
  
  var description: String {
    switch self {
    case .UserAgeOver14:
      return "[필수] 만 14세 이상입니다."
    case .ConsentOfUsingService:
      return "[필수] 서비스 이용 약관 동의"
    case .ConsentOfCollectingPrivacy:
      return "[필수] 개인정보 수집 및 이용 동의"
    case .ConsentOfPromotion:
      return "[선택] 이벤트, 프로모션 알림 메일 수신 동의"
    }
  }
  
  var URL: URL? {
    switch self {
    case .UserAgeOver14:
      return nil
    case .ConsentOfUsingService:
      return Foundation.URL(string: "https://www.naver.com")!
    case .ConsentOfCollectingPrivacy:
      return Foundation.URL(string: "https://www.naver.com")!
    case .ConsentOfPromotion:
      return Foundation.URL(string: "https://www.naver.com")!
    }
  }
  
}

final class RegisterConsentViewModel: ViewModelable {
  
  // MARK: - Opt-in Consent
  @Published var userAgeOver14: Bool = false
  @Published var consentOfUsingService: Bool = false
  @Published var consentOfCollectingPrivacy: Bool = false
  
  // MARK: - Opt-out Consent
  @Published var consentOfPromotion: Bool = false
  @Published var state: State
  
  var consents : [Bool] {
    get {
      [userAgeOver14, consentOfUsingService, consentOfCollectingPrivacy, consentOfPromotion]
    }
  }
  
  var consentValidation: AnyPublisher<Bool, Never> {
    return $userAgeOver14.combineLatest($consentOfUsingService, $consentOfCollectingPrivacy) {
      return ($0 == true && $1 == true && $2 == true)
    }
    .eraseToAnyPublisher()
  }
  
  enum Action {
    case onTapConsent(id: Int)
  }
  
  enum State {
    case confirm(Bool)
  }
  
  init() {
    state = .confirm(false)
  }
  
  func action(_ action: Action) {
    switch action {
    case .onTapConsent(let id):
      changeConsentState(by: id)
    }
  }

}

extension RegisterConsentViewModel {
  
  private func changeConsentState(by id: Int) {
    if id == 0 {
      userAgeOver14 = !userAgeOver14
    } else if id == 1 {
      consentOfUsingService = !consentOfUsingService
    } else if id == 2 {
      consentOfCollectingPrivacy = !consentOfCollectingPrivacy
    } else {
      consentOfPromotion = !consentOfPromotion
    }
    consentValidation.sink { [weak self] in
      self?.state = .confirm($0)
    }
    .cancel()
  }
  
}
