//
//  DetailView.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/06/22.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack {
            ScrollView {
                ZStack {
                    VStack {
                        Image("Detail_Activity_01") // TODO: - 태그에 따라 이미지 변경
                            .scaledToFit()
                        Spacer()
                    }
                    .ignoresSafeArea()
                    RoundedRectangle(cornerRadius: 60)
                        .foregroundColor(.gray)
                        .padding(.top, 286)
                        .ignoresSafeArea()
                        .scaledToFit()
                // TODO: - Rectangle 어디까지??
                }
            }
            .ignoresSafeArea()
            
            // button
            ZStack {
                VStack {
                    Spacer()
                    Rectangle()
                        .frame(height: 123)
                        .foregroundColor(.white)
                        .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .clear]), startPoint: .bottom, endPoint: .top))
                    // TODO: - 그라데이션 지우면 heigt을 107로 수정
                }
                
                VStack {
                    Spacer()
                    Button {
                        // action
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 14)
                                .frame(height: 56)
                                .padding(34)
                                .foregroundColor(.black)
                            Text("신청하러 가기")
                                .foregroundColor(.white)
                            // TODO: URL 연결
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
