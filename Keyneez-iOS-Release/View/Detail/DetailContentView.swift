//
//  DetailContentView.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/07/06.
//

import SwiftUI

struct DetailContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 55) // TODO: round 수정 (도형 합치기)
                .foregroundColor(.gray)
                .padding(.top, 286)
                .ignoresSafeArea()
                .scaledToFit()
            VStack {
                HStack {
                    Rectangle()
                        .foregroundColor(.red500)
                        .frame(width: 10)
                    Spacer()
                        .frame(width: 10)
                    Rectangle()
                        .frame(width: 10)
                    Spacer()
                    Image("emptyHeart")
                }
            }
            .padding(28)
        }
    }
}

struct DetailContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailContentView()
    }
}
