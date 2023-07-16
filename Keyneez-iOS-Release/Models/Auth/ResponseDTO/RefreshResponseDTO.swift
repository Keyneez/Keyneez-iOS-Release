//
//  File.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/29/23.
//

import Foundation

struct RefreshResponseDTO: ResponseProtocol {
  var status: Int?
  var message: String?
  var accessToken: String?
}
