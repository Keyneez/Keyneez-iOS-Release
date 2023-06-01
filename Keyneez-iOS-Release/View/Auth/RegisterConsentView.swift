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

struct ConsentRow: View {
  var content: ConsentContent
  var body: some View {
    HStack {
      Button(action: {}) {
        Image(systemName: "person.fill")
      }
      Text(content.consentText)
      Spacer()
      Button(action: {}) {
        Image(systemName: "chevron.right")
      }
      .opacity(content.detailURL == nil ? 0: 1)
    }
  }
}

struct RegisterConsentView: View {
  
  let consentInfo: [ConsentContent] = [
    ConsentContent(consentText: "[필수] 만 14세 이상입니다."),
    ConsentContent(consentText: "[필수] 서비스 이용 약관 동의", detailURL: URL(string: "https://www.naver.com")!),
    ConsentContent(consentText: "[필수] 개인정보 수집 및 이용 동의", detailURL: URL(string: "https://www.naver.com")!),
    ConsentContent(consentText: "[선택] 이벤트, 프로모션 알림 메일 수신 동의", detailURL: URL(string: "https://www.naver.com")!)
  ]
  
    var body: some View {
      VStack(alignment: .center) {
        HStack {
          Image(systemName: "person.fill")
          Spacer()
          Text("키니즈 이용약관 전체 동의")
          Spacer()
          Button {
            print("back")
          } label: {
            Image(systemName: "xmark").renderingMode(.template).foregroundColor(.black)
          }
        }
        .padding(20)
        List(consentInfo) { info in
          ConsentRow(content: info)
            .listRowSeparator(.hidden)
        }
        .listStyle(.grouped)
        .scrollContentBackground(.hidden)
        Button("동의 후 진행하기", action: {})
        Spacer()
      }
      
    }
}

struct RegisterConsentView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterConsentView()
    }
}
