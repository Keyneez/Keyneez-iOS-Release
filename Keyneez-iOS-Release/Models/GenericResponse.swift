//
//  Respondable.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/29/23.
//

import Foundation

struct GenericResponse<T: Codable>: Codable {
  
  var status: Int?
  var message: String?
  var data: T?
  
}
