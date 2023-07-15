//
//  KakaoLoginDTO.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/29/23.
//

import Foundation

struct KakaoLoginResponseDTO: ResponseProtocol {
  var status: Int?
  var message: String?
  var isNewUser: Bool?
  var token: Token?
  var user: UserDTO?
}
