//
//  OSLog+Extension.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/28/23.
//

import Foundation
import OSLog

extension OSLog {
  
  private static var subsystem = Bundle.main.bundleIdentifier!
  static let ui = OSLog(subsystem: subsystem, category: "UI")
  static let network = OSLog(subsystem: subsystem, category: "Network")
  
}
