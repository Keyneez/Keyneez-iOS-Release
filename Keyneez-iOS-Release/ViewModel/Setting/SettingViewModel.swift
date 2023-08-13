//
//  SettingViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/06/21.
//

import SwiftUI

final class SettingViewModel: ObservableObject {
    func checkSnsType() -> SNSType {
        return UserManager.shared.user?.snsType ?? .NONE
    }
}
