//
//  ResponseProtocol.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 7/1/23.
//

import Foundation

protocol ResponseProtocol: Codable {
  var status: Int? { get }
  var message: String? { get }
}
