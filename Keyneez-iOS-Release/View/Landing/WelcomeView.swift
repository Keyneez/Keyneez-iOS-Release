//
//  WelcomeView.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/1/23.
//

import SwiftUI
import AuthenticationServices

struct WelcomeView: View {
  
  @StateObject var viewModel: WelcomeViewModel
    
  var welcomeTexts = ["청소년들에게 필요한\n활동과 혜택 정보를 한눈에!", "다양한 세상을 키니즈와 함께 둘러볼까요?"]
 @State var page = 0
  
  var body: some View {
      ZStack {
        Image("background")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(minWidth: 0, maxWidth: .infinity)
          .edgesIgnoringSafeArea(.all)
        if viewModel.isLoading {
          ProgressView()
            .scaleEffect(2)
        }
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
          kakaoButton()
          appleButton()
          
//          SignInWithAppleButton { request in
//            request.requestedScopes = [.email, .fullName]
//          } onCompletion: {
//            result in
//              switch result {
//              case .success(let authResult):
//                print(authResult)
//              case .failure(let error):
//                viewModel.error = error
//              }
//          }
          Spacer()
            .frame(height: 20)
        }
        .padding(.horizontal)
        .errorAlert(error: $viewModel.error)
      }
  }
  
  
  @ViewBuilder
  private func appleButton() -> some View {
    
    NavigationLink(isActive: $viewModel.readyToNavigation, destination: {
      coordinate()
    }) {
          Button {
            viewModel.didTapAppleLogin()
          } label: {
            Image("appleLogin")
          }
    }
    .isDetailLink(false)
    
  }
  
  
  @ViewBuilder
  private func kakaoButton() -> some View {
    
    NavigationLink(isActive: $viewModel.readyToNavigation, destination: {
      coordinate()
    }) {
          Button {
            viewModel.didTapLoginWithKakao()
          } label: {
            Image("kakaoLogin")
          }
    }
    .isDetailLink(false)

  }
  
  
  @ViewBuilder
  private var pageControl: some View {
    HStack {
      PageIndicator(currentPage: $page, numberOfpages: 3)
    }
  }
  
  @ViewBuilder
  private func coordinate() -> some View {
    if let nextPage = viewModel.nextPage {
      switch nextPage {
      case .signup(let viewModel):
        RegisterIDView(viewModel: viewModel, overPreviousView: $viewModel.readyToNavigation, popToRootTrigger: $viewModel.readyToNavigation)
      case .home:
        TabBarView()
      }
    }
  }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
      WelcomeView(viewModel: WelcomeViewModel())
    }
}
