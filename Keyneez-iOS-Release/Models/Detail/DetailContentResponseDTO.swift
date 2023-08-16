//
//  DetailContentResponseDTO.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/07/12.
//

import Foundation

struct DetailContentResponseDTO: Codable {
  var contentPk: Int
  var title: String
  var category: String
  var tag: String?
  var link: String
  var img: String?
  var place: String
  var introduction: String
  var startAt: String?
  var endAt: String?
  var inquiry: String
  var price: String
  var benefit: String
  var createdAt: String
  var updatedAt: String
  var likes: [Like]?
}

struct Like: Codable {
  var likedPk, user, content: Int
}
