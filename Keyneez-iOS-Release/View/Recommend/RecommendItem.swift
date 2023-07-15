//
//  RecommendItem.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/5/23.
//

import Foundation
import SwiftUI

enum Tag: CustomStringConvertible {
  case activity
  case hobby
  case career
  
  var description: String {
    switch self {
    case .activity:
      return "활동"
    case .hobby:
      return "취미"
    case .career:
      return "진로"
    }
  }
  
  var color: Color {
    switch self {
    case .activity:
      return Color.indigo
    case .hobby:
      return Color.mint
    case .career:
      return Color.orange
    }
  }
}

struct RecommendItem: Hashable {
  let id: Int
  let tag: Tag
  let text: String
  let image: UIImage
  var checked: Bool
}

func makeRecommendItem(id: Int, tag: Tag, text: String) -> RecommendItem {
  return RecommendItem(id: id, tag: tag, text: text, image: UIImage(), checked: false)
}

func makeRecommendItems() -> [RecommendItem] {
  return [
    makeRecommendItem(id: 1, tag: .activity, text: "동아리/\n서포터즈"),
    makeRecommendItem(id: 2, tag: .hobby, text: "청소년\n혜택"),
    makeRecommendItem(id: 3, tag: .career, text: "강연/\n멘토링"),
    makeRecommendItem(id: 4, tag: .activity, text: "캠페인/\n공모전"),
    makeRecommendItem(id: 5, tag: .hobby, text: "문화생활/\n취미"),
    makeRecommendItem(id: 6, tag: .career, text: "장학금\n정보")
  ]
}
