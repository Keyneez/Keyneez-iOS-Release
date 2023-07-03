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
        VStack {
//            HStack {
//                Spacer()
//                    .frame(width: 25)
//                Button {
//                    // action
//                } label: {
//                    Image("Terms_backButton")
//                }
//            }
//            .frame(alignment: .leading)

            switch termsState {
            case .serviceUse:
                Text("이용약관")
            case .privacy:
                Text("개인정보")
            case .openSourceLisence:
                Text("오픈소스")
            }
            Spacer()
            HStack {
                Spacer()
                    .frame(width: 22)
                Button {
                    // action
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.black)
                        Text("동의하기")
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                .frame(height: 56)
                .cornerRadius(14)
                Spacer()
                    .frame(width: 22)
            }

        }
    }
}

struct TermsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsView(termsState: .constant(.serviceUse))
    }
}
