//
//  DetailContentResponseDTO.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/07/12.
//

import Foundation

struct DetailContentResponseDTO: Codable {
    let contentPk: Int
    let title, category, tag, link: String
    let img, place, introduction, startAt: String
    let endAt, inquiry, price, benefit: String
    let createdAt, updatedAt: String
    let likes: [Like]
}

struct Like: Codable {
    let likedPk, user, content: Int
}
