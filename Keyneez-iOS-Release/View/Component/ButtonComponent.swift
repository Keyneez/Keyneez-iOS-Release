//
//  ButtonComponent.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/07/03.
//

import SwiftUI

struct CancelButtonStyle: ButtonStyle {
    @State private var fontSize: CGFloat = 18
    @State private var pressed = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: fontSize))
            .foregroundColor(.white) // TODO: gray500
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 12.0).fill(Color.gray) // TODO: gray100
                        
            )
    }
}

struct BlackButtonStyle: ButtonStyle {
    @State private var fontSize: CGFloat = 18
    @State private var pressed = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: fontSize))
            .foregroundColor(.white) // TODO: gray500
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 12.0).fill(Color.black) // TODO: gray100
                        
            )
    }
}

