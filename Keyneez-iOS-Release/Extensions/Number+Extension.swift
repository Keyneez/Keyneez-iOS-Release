//
//  Number+Extensino.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/28/23.
//

import Foundation

protocol PxTransfable {
  func topx() -> Self
}

extension CGFloat: PxTransfable {
  func topx() -> Self {
    return self * 3/4
  }
}

extension Int {
  func topx() -> Double {
    return Double(self * 3/4)
  }
}

extension Double {
  func topx() -> Double {
    return self*3/4
  }
}
