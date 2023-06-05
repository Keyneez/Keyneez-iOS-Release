//
//  WelcomeView.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/1/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
      ZStack {
        Image("background")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(minWidth: 0, maxWidth: .infinity)
          .edgesIgnoringSafeArea(.all)
        VStack {
          Spacer()
            .frame(height: 51)
         Image("logoA")
          Spacer()
          Text("GIF 위치")
            .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2)
            .border(.black)
          Spacer()
          Button(action: {}) {
            Image("kakaoLogin")
          }
          Button(action: {}) {
            Image("appleLogin")
          }
          Spacer()
            .frame(height: 20)
        }
      }
      .padding(.horizontal)
    }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
