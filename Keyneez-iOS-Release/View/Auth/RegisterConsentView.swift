//
//  RegisterConsentView.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/1/23.
//

import SwiftUI

struct ConsentContent: Identifiable, Hashable {
  var id = UUID()
  var content: Constent
}

struct RegisterConsentView: View {
  
  @StateObject var viewModel = RegisterConsentViewModel()
  @Binding var isPresent: Bool
  @Binding var confirmed: Bool
  
  let consentInfo: [ConsentContent] = Constent.allCases.map { return ConsentContent(content: $0) }
  
    var body: some View {
      VStack(alignment: .center) {
        HStack {
          confirmationImage()
          Spacer().frame(width: 14)
          Text("키니즈 이용약관 전체 동의")
          Spacer()
          Button {
            isPresent = false
          } label: {
            Image(systemName: "xmark").renderingMode(.template).foregroundColor(.black)
          }
        }
        .padding(.horizontal, 24)
        .padding(.top, 26)
         
        
        List(consentInfo, id: \.self) { info in
          ZStack {
            Button("") {
              viewModel.action(.onTapConsent(id: info.content.rawValue))
            }
            ConsentRow(content: info, viewModel: viewModel)
              .listRowSeparator(.hidden)
          }
          
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
      confirmButton()
        Spacer()
      }
      
    }
  
  @ViewBuilder
  private func confirmButton() -> some View {
    Button(action: {
     isPresent = false
      switch viewModel.state {
        case .confirm(let ok):
          confirmed = ok
      }
    }) {
      Text("동의 후 진행하기")
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(17 * 3/4)
    }
    .buttonStyle(.borderedProminent)
    .tint(updateConfirmButtonColor())
    .padding(.horizontal, 22)
  }
  
  @ViewBuilder
  private func confirmationImage() -> some View {
    switch viewModel.state {
    case let .confirm(ok):
      if ok {
        Image("on")
      } else {
        Image("unchecked_eclipse")
      }
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
      RegisterConsentView(isPresent: .constant(false), confirmed: .constant(false))
    }
}
