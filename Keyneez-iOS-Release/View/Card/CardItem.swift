//
//  CardItem.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/09.
//

import Foundation
import SwiftUI

struct CardItem: Hashable {
  let pk: Int
  let tag: Tag
  let title: String
  let startAt: String
  let endAt: String
  let img: String
  var heart: Bool
  var checked: Bool
}

func makeCardItem(pk: Int, tag: Tag, title: String, startAt: String, endAt: String, img: String, heart: Bool) -> CardItem {
  return CardItem(pk: pk, tag: tag, title: title, startAt: startAt, endAt: endAt, img: img, heart: heart, checked: false)
}

func makeCardItems() -> [CardItem] {
  return [
    makeCardItem(pk: 1, tag: .activity, title: "동아리/\n서포터즈", startAt:"2000.00.01", endAt: "2000.00.01", img: "hobby", heart: true),
    makeCardItem(pk: 2, tag: .hobby, title: "동아리/\n서포터즈", startAt:"2000.00.02", endAt: "2000.00.02", img: "hobby", heart: false),
    makeCardItem(pk: 3, tag: .career, title: "동아리/\n서포터즈", startAt:"2000.00.03", endAt: "2000.00.03", img: "hobby", heart: true),
    makeCardItem(pk: 4, tag: .activity, title: "동아리/\n서포터즈", startAt:"2000.00.04", endAt: "2000.00.04", img: "hobby", heart: false),
    makeCardItem(pk: 5, tag: .activity, title: "동아리/\n서포터즈", startAt:"2000.00.05", endAt: "2000.00.05", img: "hobby", heart: true),
    makeCardItem(pk: 6, tag: .activity, title: "동아리/\n서포터즈", startAt:"2000.00.06", endAt: "2000.00.06", img: "act_award", heart: true),
    makeCardItem(pk: 7, tag: .activity, title: "동아리/\n서포터즈", startAt:"2000.00.07", endAt: "2000.00.07", img: "hobby", heart: true),
    makeCardItem(pk: 8, tag: .career, title: "동아리/\n서포터즈", startAt:"2000.00.08", endAt: "2000.00.08", img: "hobby", heart: true),
    makeCardItem(pk: 9, tag: .activity, title: "동아리/\n서포터즈", startAt:"2000.00.09", endAt: "2000.00.09", img: "hobby", heart: true),

  ]
}
