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
        VStack {
          Spacer().frame(height:32 * 3/4)
          RegisterIDView()
        }
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {}) {
              Image(systemName: "chevron.left").renderingMode(.template)
                .foregroundColor(.black)
            }
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
