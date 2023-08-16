//
//  LogoutResponseDTO.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/29/23.
//

import Foundation

struct LogoutResponseDTO: Codable {
    let status: Int
    let message: String
    let data: [String]?
}
