//
//  TermsView.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/06/22.
//

import SwiftUI

struct TermsView: View {
    @Binding var termsState: TermsViewState
    
    var body: some View {
        ZStack {
            VStack {
                switch termsState {
                case .serviceUse:
                    Text("이용약관 내용")
                case .privacy:
                    Text("개인정보 내용")
                case .openSourceLisence:
                    Text("오픈소스 내용")
                }
                Spacer()
            }
            ZStack {
                VStack {
                    Spacer()
                    Rectangle()
                        .frame(height: 170)
                        .foregroundColor(.white)
                        .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .clear]), startPoint: .bottom, endPoint: .top))
                }
                VStack {
                    Spacer()
                    Button {
                        // 동의하기 action
                    } label: {
                        Text("동의하기")
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .foregroundColor(.white)
                            .font(.pretendard(.medium, size: 18))
                            .background(Color.gray900)
                            .cornerRadius(14)
                            .padding([.leading,.trailing], 21)
                            .padding([.bottom], 34)
                        // TODO: URL 연결
                    }
                }
            }.ignoresSafeArea()
        }
    }
}

struct TermsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsView(termsState: .constant(.serviceUse))
    }
}
