//
//  KakaoLoginDTO.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/29/23.
//

import Foundation

struct LoginResponseDTO: Codable {
  var isNewUser: Bool?
  var token: Token?
  var user: UserDTO?
}


