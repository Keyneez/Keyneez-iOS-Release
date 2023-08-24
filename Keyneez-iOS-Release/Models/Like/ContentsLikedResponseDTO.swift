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


extension ContentsLikedResponseDTO {
  var imgName: String {
    if !category.isEmpty {
      switch category {
      case "취미":
        return category
      case "활동":
        return "활동_서포터즈"
      case "진로" :
        return "진로_강연"
      default:
        ""
      }
    }
    return ""
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
}
