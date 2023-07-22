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
          Image("logoA")
          Spacer().frame(height: 40)
          GifImage("roof1")
            .frame(width: UIScreen.main.bounds.width, height: 323)
          Carousel.frame(height: 50)
          pageControl
          Spacer().frame(height: 70)
          kakaoButton()
          appleButton()
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
  private var Carousel: some View {
    TabView(selection: $page) {
      Text(welcomeTexts[0])
        .multilineTextAlignment(.center)
        .font(.pretendard(.semiBold, size: 20))
        .tag(0)
      Text(welcomeTexts[1])
        .multilineTextAlignment(.center)
        .font(.pretendard(.semiBold, size: 20))
        .tag(1)
    }
    .tabViewStyle(.page(indexDisplayMode: .never))
  }
  
  @ViewBuilder
  private var pageControl: some View {
    HStack {
      PageIndicator(currentPage: $page, numberOfpages: 2)
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
