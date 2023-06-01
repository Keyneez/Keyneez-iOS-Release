//
//  RegisterIDView.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/1/23.
//

import SwiftUI

struct RegisterContainerView: View {
    var body: some View {
      NavigationView {
        RegisterIDView()
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button("back") { }
          }
        }
      }
      .navigationViewStyle(.stack)
    }
}

struct RegisterContainerView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterContainerView()
    }
}
