//
//  ExploreViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/27.
//

import SwiftUI

class ExploreViewModel: ObservableObject {
    @Published var serachKey: String = ""
    @Published var exploreSearchNumber: Int = 0
}

