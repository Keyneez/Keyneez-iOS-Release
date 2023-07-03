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
            Color.gray.ignoresSafeArea()
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.white)
                    .padding(.top, 286)
            }
            
            
            // button
            VStack {
                Spacer()
                Button {
                    // action
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .frame(height: 56)
                            .padding(22)
                            .foregroundColor(.black)
                        Text("신청하러 가기")
                            .foregroundColor(.white)
                    }
                }
            }
            
        }
//        ScrollView {
//            Image("DetailView")
//        }.ignoresSafeArea()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
