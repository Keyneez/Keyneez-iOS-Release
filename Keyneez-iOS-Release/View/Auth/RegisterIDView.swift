//
//  RegisterIDView.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/1/23.
//

import SwiftUI

struct RegisterIDView: View {
  
  @StateObject var viewModel: RegisterIDViewModel
  @State var presentSheet = false
  @State var consentFinished = false
  @Binding var overPreviousView: Bool
  @Binding var popToRootTrigger: Bool

  var body: some View {
    VStack(alignment: .leading) {
      
      Text("간단한 정보를 알려주세요.")
        .font(.system(size: 24, weight: .bold))
        .padding(.leading, 28)
        .padding(.bottom, 12)
      
      Text("맞춤정보 제공을 위해 필요해요")
        .padding(.leading, 28)
        .font(.system(size: 14))
      
      Spacer()
        .frame(height: 48)
      
      Text("닉네임")
        .font(.system(size:14))
        .padding(.horizontal, 24)
        .padding(.bottom, 16)
      VStack(alignment: .leading) {
        HStack {
          TextField("2~6자 한글, 영문, 숫자 사용가능", text: $viewModel.nickName)
            .font(.system(size: 20, weight: .medium))
          if viewModel.nickNameState != .available {
            checkImage().foregroundColor(viewModel.nickNameState.color)
          } else {
            checkImage()
          }
        }
        .padding(.bottom, 8)
        .padding(.horizontal, 29)
        
        Rectangle()
          .frame(height: 1)
          .foregroundColor(viewModel.nickNameState.color)
          .padding(.horizontal, 24)
      }
      Spacer().frame(height: 31)
      
      HStack {
        VStack(alignment: .leading) {
          Text("생년월일")
            .font(.system(size: 14))
          VStack(alignment: .leading) {
            HStack {
              TextField("YY/MM/DD", text: $viewModel.birthDate)
                .keyboardType(.numberPad)
                .font(.system(size: 20, weight: .regular))
              
              if viewModel.birthDateState != .available {
                checkBirthDateTextFieldImage().foregroundColor(viewModel.birthDateState.color)
              } else {
                checkBirthDateTextFieldImage()
              }
            }
            .padding(.top, 8)
            .padding(.bottom, 8)
            
            Rectangle()
              .frame(height: 1)
              .foregroundColor(viewModel.birthDateState.color)
          }
        }
        
        Spacer().frame(width: 29)
        
        VStack(alignment: .leading) {
          Text("성별")
            .font(.system(size: 14))
          VStack(alignment: .leading) {
            HStack {
              makeGenderButton(text: "남성") {
                viewModel.action(.onTapGenderButton(gender: .man))
              }
              .background(checkGenderButtonBackgroundColor(in: .man))
              .foregroundColor(updateGenderButtonTintColor(in: .man))
              .buttonStyle(.plain)
              .cornerRadius(12)
              
              Spacer().frame(width: 15)
              makeGenderButton(text: "여성") {
                viewModel.action(.onTapGenderButton(gender: .woman))
              }
              .background(checkGenderButtonBackgroundColor(in: .woman))
              .foregroundColor(updateGenderButtonTintColor(in:.woman))
              .buttonStyle(.plain)
              .cornerRadius(12)
            }
          }
        }
        
      }
      .padding(.horizontal, 24)
      Spacer()
      
      makeNextButtonView()
        .sheet(isPresented: $presentSheet, onDismiss: {
          viewModel.action(.onDismissConsentView(ok: consentFinished))
        }) {
          RegisterConsentView(isPresent: $presentSheet, confirmed: $consentFinished)
            .presentationDetents([.height(350)])
            .background(
                 RoundedRectangle(cornerRadius: 21)
                  .foregroundColor(.clear) 
             )
        }
        
    }
    .navigationBarBackButtonHidden(true)
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        Button(action: {
          overPreviousView = false
        }) {
          Image(systemName: "chevron.left").renderingMode(.template)
            .foregroundColor(.black)
        }
      }
    }
  }
}

extension RegisterIDView {
  
  @ViewBuilder
  private func cooridinate() -> some View {
    if let recommendViewModel = viewModel.recommendViewModel {
      RecommendView(viewModel: recommendViewModel, overPreviousView: $viewModel.readyToNavigation, popToRoot: $popToRootTrigger)
    } else {
      TabBarView()
    }
  }
  
  @ViewBuilder
  private func makeGenderButton(text: String, action: @escaping () -> Void ) -> some View {
    Button(action: {
      action()
    }) {
      Text(text)
        .font(.system(size: 16, weight: .medium))
        .padding(.horizontal, 21)
        .padding(.vertical, 9)
    }
    
  }
  
  private func checkBirthDateTextFieldImage() -> Image {
    if viewModel.birthDateState == .available {
      return Image("checked")
    }
    return Image("unchecked").renderingMode(.template)
  }
  
  private func checkGenderButtonBackgroundColor(in gender: Gender) -> Color {
    if viewModel.gender == .man {
      return gender == .man ? Color(uiColor: .black) : Color(uiColor: .systemGray5)
    } else if viewModel.gender == .woman {
      return gender == .woman ? Color(uiColor: .black) : Color(uiColor: .systemGray5)
    } else {
      return Color(uiColor: .systemGray5)
    }
  }
  
  private func updateGenderButtonTintColor(in gender: Gender) -> Color {
    if viewModel.gender == .man {
      return gender == .man ? Color(uiColor: .white) : Color(uiColor: .systemGray2)
    } else if viewModel.gender == .woman {
      return gender == .woman ? Color(uiColor: .white) : Color(uiColor: .systemGray2)
    }
    return Color(uiColor: .systemGray2)
  }
  
  private func checkImage() -> Image {
    if (viewModel.nickNameState == .default) || (viewModel.nickNameState == .specialSymbol) || viewModel.nickNameState == .overSix {
      return Image("unchecked")
        .renderingMode(.template)
    }
    return Image("checked")
  }
  
  private func isNicknameAvailable() -> Color {
    if viewModel.nickNameState == .available {
      return Color(uiColor: .black)
    }
    return Color(uiColor: .gray)
  }
  
  private func updateConfirmationState() -> Color {
    switch viewModel.state {
    case .confirm(let ok):
      if ok {
        return Color(uiColor: .black)
      }
      return Color(uiColor: .gray)
    }
  }
  
  @ViewBuilder
  private func makeNextButtonView() -> some View {
    switch viewModel.state {
    case .confirm(let ok):
      
      NavigationLink(isActive: $viewModel.readyToNavigation) {
        cooridinate()
      } label: {
        Button(action: {
          if ok == true {
            presentSheet = true
          }
        }) {
          Text("다음")
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(17.topx())
        }
        .buttonStyle(.borderedProminent)
        .tint(updateConfirmationState())
        .padding(.horizontal, 22)
      }
      .isDetailLink(false)
    }
    
  }
  
}

struct RegisterIDView_Previews: PreviewProvider {
    static var previews: some View {
      RegisterIDView(viewModel: .init(idToken: "", oauthType: ""), overPreviousView: .constant(false), popToRootTrigger: .constant(false))
    }
}
