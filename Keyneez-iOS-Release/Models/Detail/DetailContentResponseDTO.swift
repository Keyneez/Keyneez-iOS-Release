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
  var inquiry: [String]
  var price: [String]
  var benefit: [String]
  var createdAt: String
  var updatedAt: String
  var Likes: [Likes]?
}
  
  struct Likes: Codable {
    let likedPk: Int
    let user: Int
    let content: Int
  }


extension DetailContentResponseDTO {
  var imgName: String {
    if let tag = tag, !tag.isEmpty {
      return category == "취미" ? category : "\(category)_\(tag)"
    } else {
      return [
        "진로": "진로_멘토링",
        "활동": "활동_서포터즈"
      ][category, default: category]
    }
  }
  
  var periodString: String {
    guard let start = startAt, !start.isEmpty else {
      return ""
    }
    
    if start.contains("9999") || (endAt?.contains("9999") ?? false) {
      return "상시"
    }
    
    return "\(start) - \(endAt ?? "")"
  }
  
  var isHeartOn : Bool {
    return Likes?.isEmpty == false ? true : false
   }
}
