//
//  SettingPopUpView.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/06/21.
//

import SwiftUI

struct SettingPopUpView: View {
  @Binding var viewModel: SettingViewModel
  @Binding var isVisible: Bool
  @Binding var popUpState: SettingPopUpState
  @Binding var userLogout: Bool // 임시 변수: user로 대체
  
  private var popUpTitle: String {
    switch popUpState {
    case .logOut:
      return "키니즈 서비스를\n로그아웃하시겠어요?"
    case .withDraw:
      return "키니즈 서비스를\n정말로 탈퇴하시겠어요?"
    }
  }
  
  private var popUpDescription: String {
    switch popUpState {
    case .logOut:
      return "로그인 후 다시 내 정보를 불러올 수 있어요 🙂"
    case .withDraw:
      return "탈퇴하시면 저장된 정보를 되돌릴 수 없어요 🥲"
    }
  }
  
  private var rightButtonText: String {
    switch popUpState {
    case .logOut:
      return "로그아웃하기"
    case .withDraw:
      return "탈퇴하기"
    }
  }
  
  var body: some View {
    ZStack {
      Rectangle()
        .cornerRadius(21)
        .foregroundColor(Color.white)
        .padding([.leading,.trailing], 34)
        .frame(height: 204)
      VStack(alignment: .leading) {
        Spacer()
          .frame(height: 21)
        Text(popUpTitle)
          .font(.pretendard(.semiBold, size: 20))
          .foregroundColor(.gray900)
          .lineSpacing(1)
        Spacer()
          .frame(height: 8)
        Text(popUpDescription)
          .font(.pretendard(.medium, size: 14))
          .foregroundColor(.gray500)
        Spacer()
          .frame(height: 23)
        HStack {
          Button {
            isVisible.toggle()
          } label: {
            Text("취소")
              .font(.pretendard(.medium, size: 18))
              .foregroundColor(.gray500)
          }.buttonStyle(CancelButtonStyle())
          Button {
            switch (UserManager.shared.user?.snsType) {
            case .APPLE:
              viewModel.didTapLogoutWithApple()
            case .KAKAO:
              viewModel.didTapLogoutWithKakao()
            default:
              print("none")
            }
            isVisible.toggle()
            userLogout.toggle()
          } label: {
            Text(rightButtonText)
              .font(.pretendard(.medium, size: 18))
          }.buttonStyle(BlackButtonStyle())
        }
        Spacer()
          .frame(height: 17)
      }
      .padding([.leading, .trailing], 52)
    } // ZStack End
    .background(Color.black.opacity(0))
  } // body End
}

struct SettingPopUpView_Previews: PreviewProvider {
  static var previews: some View {
    SettingPopUpView(viewModel: .constant(SettingViewModel()), isVisible: .constant(false), popUpState: .constant(.logOut), userLogout: .constant(false))
  }
}
