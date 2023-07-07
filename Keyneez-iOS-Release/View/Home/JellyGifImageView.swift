//
//  JellyGifImageView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/06/26.
//

import SwiftUI

struct JellyGifImageView: View {
    var body: some View {
        Color.gray100
        .ignoresSafeArea(.all)
        .overlay(
          GifImage("jelly_gif")
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
        )
    }
}

struct JellyGifImageView_Previews: PreviewProvider {
    static var previews: some View {
        JellyGifImageView()
    }
}
