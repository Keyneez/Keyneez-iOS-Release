//
//  RegisterConsentView.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/1/23.
//

import SwiftUI

struct ConsentContent: Identifiable {
  var id = UUID()
  var consentText: String
  var detailURL: URL?
}

struct RegisterConsentView: View {
  
  @StateObject var viewModel = RegisterConsentViewModel()
  
  let consentInfo: [ConsentContent] = [
    ConsentContent(consentText: "[필수] 만 14세 이상입니다."),
    ConsentContent(consentText: "[필수] 서비스 이용 약관 동의", detailURL: URL(string: "https://www.naver.com")!),
    ConsentContent(consentText: "[필수] 개인정보 수집 및 이용 동의", detailURL: URL(string: "https://www.naver.com")!),
    ConsentContent(consentText: "[선택] 이벤트, 프로모션 알림 메일 수신 동의", detailURL: URL(string: "https://www.naver.com")!)
  ]
  
    var body: some View {
      VStack(alignment: .center) {
        HStack {
          Image("unchecked_eclipse")
          Spacer().frame(width: 14)
          Text("키니즈 이용약관 전체 동의")
          Spacer()
          Button {
            print("back")
          } label: {
            Image(systemName: "xmark").renderingMode(.template).foregroundColor(.black)
          }
        }
        .padding(.horizontal, 24)
        .padding(.top, 26)
        
        
        List(consentInfo) { info in
          ConsentRow(content: info)
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        
        Button(action: {}) {
          Text("동의 후 진행하기")
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(17 * 3/4)
        }
        .buttonStyle(.borderedProminent)
        .tint(updateConfirmButtonColor())
        .padding(.horizontal, 22)
      
        Spacer()
      }
      
    }
  
  private func updateConfirmButtonColor() -> Color {
    switch viewModel.state {
    case let .confirm(ok):
      if ok == true {
        return .black
      }
      return .gray
    }
  }
}

struct RegisterConsentView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterConsentView()
    }
}
