//
//  Number+Extensino.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/28/23.
//

import SwiftUI

let screen = UIScreen.main.bounds
let screenWidth = screen.width
let screenHeight = screen.height

protocol PxTransfable {
    func topx() -> Self
}

extension CGFloat: PxTransfable {
    func topx() -> Self {
        return self * 3/4
    }
    
    var adjusted: CGFloat {
        let ratio: CGFloat = screenWidth / 390
        let ratioH: CGFloat = screenHeight / 844
        return ratio <= ratioH ? self * ratio : self * ratioH
    }
}

extension Int {
    func topx() -> Double {
        return Double(self * 3/4)
    }
    
    var adjusted: CGFloat {
        let ratio: CGFloat = screenWidth / 390
        let ratioH: CGFloat = screenHeight / 844
        return ratio <= ratioH ? CGFloat(self) * ratio : CGFloat(self) * ratioH
    }
}

extension Double {
    func topx() -> Double {
        return self*3/4
    }
    var adjusted: CGFloat {
      let ratio: CGFloat = screenWidth / 390
      let ratioH: CGFloat = screenHeight / 844
      return ratio <= ratioH ? CGFloat(self) * ratio : CGFloat(self) * ratioH
    }
}
