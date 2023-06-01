//
//  WelcomeView.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/1/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
      VStack {
        Image(systemName: "person.fill")
        Image(systemName: "person.fill")
        Button("카카오 로그인", action: {})
        Button("애플 로그인", action: {})
      }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
