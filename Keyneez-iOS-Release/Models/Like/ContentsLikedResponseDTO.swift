//
//  ContentsLikedResponseDTO.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/16.
//

import Foundation

struct ContentsLikedResponseDTO: Codable {
  var contentPk: Int
  var title: String
  var category: String
  var img: String?
  var startAt: String?
  var endAt: String?
}
