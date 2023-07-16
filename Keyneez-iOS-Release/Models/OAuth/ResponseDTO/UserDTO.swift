//
//  UserDTO.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/29/23.
//

import Foundation

enum DTOError: Error {
  case notTransferable
}

struct UserDTO: Codable {
  var userPk: Int?
  var nickname: String?
  var email: String?
  var gender: String?
  var birth: String?
  var snsType: String?
  var createdAt: String?
  var updatedAt: String?
}

extension UserDTO {
  func toDomain() throws -> User {
    
    guard let email = email, let gender = gender, let birth = birth, let snsType = snsType else {
      throw DTOError.notTransferable
    }

    return User(nickName: nickname ?? "민지사랑해", email: email, gender: Gender.makeGender(keyword: gender), birth: birth, snsType: SNSType(rawValue: snsType) ?? .NONE)
    
  }
}
