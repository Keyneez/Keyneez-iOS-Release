//
//  CardItem.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/09.
//

import Foundation
import SwiftUI

struct CardItem: Hashable {
  let id: Int
  let tag: Tag
  let title: String
  let startAt: String
  let endAt: String
  let img: String
  var heart: Bool
  var checked: Bool
}

func makeCardItem(id: Int, tag: Tag, title: String, startAt: String, endAt: String, img: String) -> CardItem {
  return CardItem(id: id, tag: tag, title: title, startAt: startAt, endAt: endAt, img: img, heart: false, checked: false)
}

func makeCardItems() -> [CardItem] {
  return [
    makeCardItem(id: 1, tag: .activity, title: "동아리/\n서포터즈", startAt:"2000.00.01", endAt: "2000.00.01", img: "hobby"),
    makeCardItem(id: 2, tag: .hobby, title: "동아리/\n서포터즈", startAt:"2000.00.02", endAt: "2000.00.02", img: "hobby"),
    makeCardItem(id: 3, tag: .career, title: "동아리/\n서포터즈", startAt:"2000.00.03", endAt: "2000.00.03", img: "hobby"),
    makeCardItem(id: 4, tag: .activity, title: "동아리/\n서포터즈", startAt:"2000.00.04", endAt: "2000.00.04", img: "hobby"),
    makeCardItem(id: 5, tag: .activity, title: "동아리/\n서포터즈", startAt:"2000.00.05", endAt: "2000.00.05", img: "hobby"),
    makeCardItem(id: 6, tag: .activity, title: "동아리/\n서포터즈", startAt:"2000.00.06", endAt: "2000.00.06", img: "hobby"),
    makeCardItem(id: 7, tag: .activity, title: "동아리/\n서포터즈", startAt:"2000.00.07", endAt: "2000.00.07", img: "hobby"),
    makeCardItem(id: 8, tag: .activity, title: "동아리/\n서포터즈", startAt:"2000.00.08", endAt: "2000.00.08", img: "hobby"),
  ]
}
