//
//  RegisterIDView.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/1/23.
//

import SwiftUI

struct RegisterIDView: View {
  @State var nickName: String = ""
  @State var nickNameState: NicknameState = .default
  @State var presentSheet = false
  
    var body: some View {
      VStack(alignment: .leading) {
        
        Text("사용하실 닉네임을\n입력해주세요!")
          .font(.system(size: 24, weight: .bold))
          .padding(.leading, 28)
        
        Spacer()
          .frame(height: 48)
        VStack {
          HStack {
            TextField("닉네임 입력하기", text: $nickName)
              .font(.system(size: 20, weight: .bold))
            Image(nickNameState == NicknameState.default ? "unchecked": "checked")
          }
          .padding(.top, 8)
          .padding(.bottom, 8)
          .padding(.horizontal, 29)
          
          Rectangle()
            .frame(height: 1)
            .foregroundColor(Color(.systemGray4))
            .padding(.horizontal, 24)
        }
        
        
        Text("2-6자로 한글,영문,숫자를 조합해 사용할 수 있어요.")
          .foregroundColor(Color(uiColor: .systemGray4))
          .font(.system(size: 14, weight: .medium))
          .padding(.horizontal, 29)
        
        Spacer()
        Button(action: {
          presentSheet = true
        }) {
          Text("다음")
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
        }
        .buttonStyle(.bordered)
        .padding(.horizontal, 22)
      }
      .sheet(isPresented: $presentSheet) {
        RegisterConsentView()
          .presentationDetents([.height(382)])
      }
    }
}

struct RegisterIDView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterIDView()
    }
}
