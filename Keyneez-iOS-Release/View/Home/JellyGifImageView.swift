//
//  JellyGifImageView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/06/26.
//

import SwiftUI

struct JellyGifImageView: View {
  @State private var isShowRecommendView = false
  @EnvironmentObject var router: Router

// navigation animation disable
//  init() {
//    UINavigationBar.setAnimationsEnabled(false)
//  }
  var body: some View {
    NavigationStack(path: $router.path) {
      Color.gray100
        .ignoresSafeArea(.all)
        .overlay(
          GifImage("jelly_gif")
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
            .toolbar(.hidden, for: .tabBar)
        )
        .onAppear {
          DispatchQueue.main.asyncAfter(deadline: .now()+2.5) {
            router.gotoMainRecommendView()
          }
        }
        .navigationDestination(for: Views.self) { destination in
          ViewFactory.viewForDestination(destination)
        }
        .navigationBarBackButtonHidden(true)
    }
  }
}
