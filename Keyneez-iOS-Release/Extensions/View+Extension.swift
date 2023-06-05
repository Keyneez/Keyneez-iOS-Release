//
//  View+Extension.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/5/23.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
