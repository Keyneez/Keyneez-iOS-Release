//
//  RegisterIDView.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/1/23.
//

import SwiftUI

enum LoginFlowView {
  case welcome
  case id
}

struct RegisterContainerView: View {
  
  
    var body: some View {
      NavigationView {
        VStack {
          WelcomeView(viewModel: WelcomeViewModel())
        }
      }
      
    }
}

struct RegisterContainerView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterContainerView()
    }
}
