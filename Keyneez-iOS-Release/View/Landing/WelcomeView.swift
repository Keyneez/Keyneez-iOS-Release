//
//  WelcomeView.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/1/23.
//

import SwiftUI


struct WelcomeView: View {
    
  var welcomeTexts = ["청소년들에게 필요한\n활동과 혜택 정보를 한눈에!", "다양한 세상을 키니즈와 함께 둘러볼까요?"]
 @State var page = 0
  
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
          Text(welcomeTexts[0])
            .multilineTextAlignment(.center)
            .font(.system(size: 20 * 3/4, weight: .bold))
          pageControl
          Spacer()
          Button(action: {
            
          }) {
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
  
  @ViewBuilder
  private var pageControl: some View {
    HStack {
      PageIndicator(currentPage: $page, numberOfpages: 3)
    }
  }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
