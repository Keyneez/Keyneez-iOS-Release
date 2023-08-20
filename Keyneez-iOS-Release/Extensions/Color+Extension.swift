//
//  Color+Extension.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/30/23.
//  Created by 최효원 on 2023/06/11.
//

import SwiftUI

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex >> 16) & 0xff) / 255
        let green = Double((hex >> 8) & 0xff) / 255
        let blue = Double((hex >> 0) & 0xff) / 255

        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
  
  static let mint600 = Color("mint600")
  static let mint500 = Color("mint500")
  static let mint400 = Color("mint400")
  static let mint300 = Color("mint300")
  static let mint200 = Color("mint200")

  static let red600 = Color("red600")
  static let red500 = Color("red500")
  static let red400 = Color("red400")
  static let red300 = Color("red300")
  static let red200 = Color("red200")
  
  static let purple600 = Color("purple600")
  static let purple500 = Color("purple500")
  static let purple400 = Color("purple400")
  static let purple300 = Color("purple300")
  static let purple200 = Color("purple200")
  
  static let gray900 = Color("gray900")
  static let gray800 = Color("gray800")
  static let gray700 = Color("gray700")
  static let gray600 = Color("gray600")
  static let gray500 = Color("gray500")
  static let gray400 = Color("gray400")
  static let gray300 = Color("gray300")
  static let gray200 = Color("gray200")
  static let gray100 = Color("gray100")
  static let gray050 = Color("gray050")

  static let mainBackground1 = Color("mainBackground1")
  static let mainBackground2 = Color("mainBackground2")
    
  static let navigationColor = Color("navigationColor")

  static func categoryColor(for category: String) -> Color {
       switch category {
       case "활동":
         return .purple500
       case "진로":
         return .red500
       case "취미":
         return .mint500
       default:
           return Color.black
       }
   }
}
