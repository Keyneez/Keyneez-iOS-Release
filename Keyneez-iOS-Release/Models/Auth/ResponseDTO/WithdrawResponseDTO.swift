//
//  WithdrawResponseDTO.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/08/28.
//

import Foundation

struct WithdrawResponseDTO: Codable {
  var status: Int
  var message: String
  var data: [String]?
}
