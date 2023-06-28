//
//  MoyaProvider+Extension.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/28/23.
//

import Foundation
import Moya

extension MoyaProvider {
  func request(_ target: Target) async -> Result<Response, MoyaError> {
    await withCheckedContinuation({ continuation in
      self.request(target) { result in
        continuation.resume(returning: result)
      }
    })
  }
}
