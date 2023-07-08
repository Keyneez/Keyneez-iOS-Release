//
//  JellyGifImageView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/06/26.
//

import SwiftUI

struct JellyGifImageView: View {
  @State private var isShowRecommendView = false
// navigation animation disable
//  init() {
//    UINavigationBar.setAnimationsEnabled(false)
//  }
  var body: some View {
    NavigationStack {
      Color.gray100
        .ignoresSafeArea(.all)
        .overlay(
          GifImage("jelly_gif")
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
            .toolbar(.hidden, for: .tabBar)
        )
        .onAppear {
          DispatchQueue.main.asyncAfter(deadline: .now()+2.5) {
            isShowRecommendView = true
          }
        }
        .background(
          NavigationLink(destination: RecommendView(), isActive: $isShowRecommendView) {
            EmptyView()
          }
            .navigationBarBackButtonHidden(true)
        )
    }
    .animation(nil)
  }
}


struct JellyGifImageView_Previews: PreviewProvider {
  static var previews: some View {
    JellyGifImageView()
  }
}
