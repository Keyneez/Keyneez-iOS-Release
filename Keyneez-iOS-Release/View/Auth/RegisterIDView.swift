//
//  RegisterIDView.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/1/23.
//

import SwiftUI

struct RegisterIDView: View {
  
  @StateObject var viewModel = RegisterIDViewModel()
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
            TextField("닉네임 입력하기", text: $viewModel.nickName)
              .font(.system(size: 20, weight: .bold))
            Image(checkImage())
          }
          .padding(.top, 8)
          .padding(.bottom, 8)
          .padding(.horizontal, 29)
          
          Rectangle()
            .frame(height: 1)
            .foregroundColor(viewModel.nickNameState.color)
            .padding(.horizontal, 24)
        }
        
        
        Text(viewModel.nickNameState.description)
          .foregroundColor(viewModel.nickNameState.color)
          .font(.system(size: 14, weight: .medium))
          .padding(.horizontal, 29)
        
        Spacer()
        Button(action: {
          presentSheet = true
        }) {
          Text("다음")
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(17 * 3/4)
        }
        .buttonStyle(.borderedProminent)
        .tint(isNicknameAvailable())
        .padding(.horizontal, 22)
      }
      .sheet(isPresented: $presentSheet) {
        RegisterConsentView()
          .presentationDetents([.height(350)])
          .presentationCornerRadius(21)
      }
    }
  
  private func checkImage() -> String {
    if (viewModel.nickNameState == .default) || (viewModel.nickNameState == .specialSymbol) {
      return "unchecked"
    }
    return "checked"
  }
  
  private func isNicknameAvailable() -> Color {
    if viewModel.nickNameState == .available {
      return Color(uiColor: .black)
    }
    return Color(uiColor: .gray)
  }
  
}

struct RegisterIDView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterIDView()
    }
}
