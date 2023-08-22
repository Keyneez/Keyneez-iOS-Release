//
//  ExploreViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/27.
//

import SwiftUI

class ExploreViewModel: ObservableObject {
  @Published var currentTab: Int = 0
  @Published var serachKey: String = ""
  @Published var exploreSearchNumber: Int = 0
  @Published var popularSelectedButton: FilterTagType = .all
  @Published var recentSelectedButton: FilterTagType = .all
  @Published var ScrollViewOffset: CGFloat = 0
  @Published var StartOffset: CGFloat = 0
  @Published var isNavigationBarHidden = false
  
}

