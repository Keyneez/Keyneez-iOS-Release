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
          .padding(20)
        HStack {
          TextField("닉네임 입력하기", text: $nickName)
          Image(systemName: "person.fill")
        }
        .padding(10)
        .overlay{
          RoundedRectangle(cornerRadius: 10)
            .stroke(.gray, lineWidth: 2)
        }
        .padding(.horizontal)
        
        Text("2-6자로 한글,영문,숫자를 조합해 사용할 수 있어요.")
          .padding(.horizontal)
        
        Spacer()
        Button("다음", action: {
          presentSheet = true
        })
        .padding(.horizontal)
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
