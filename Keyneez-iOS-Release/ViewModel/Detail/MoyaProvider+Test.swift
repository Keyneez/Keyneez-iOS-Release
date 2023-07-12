//
//  MoyaProvider+Test.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/07/12.
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

// TODO: - 머지 후 삭제 예정
