//
//  SettingView.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/06/03.
//

import SwiftUI

struct SettingView: View {
    @State private var settingViewModel = SettingViewModel()
    
    @State private var isOnAutoLogIn = false
    @State private var isOnPushAlert = false
    @State private var isOnPopUp = false
    @State private var popUpState = SettingPopUpState.logOut
    @State private var termsViewState = TermsViewState.serviceUse
    @State private var isShowingToastMessage = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Pretendard-SemiBold", size: 26)!]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        Section() {
                            VStack(alignment: .leading, spacing: 0) {
                                HStack() {
                                  Text(settingViewModel.userName ?? "유저 이름")
                                        .foregroundColor(.gray900)
                                        .font(.pretendard(.semiBold, size: 20))
                                }
                                .padding(.bottom, 20)
                                .padding(.top, 48)
                                .padding(.leading, 28)
                                makeGraySpacing()
                            }
                        }
                        .listRowInsets(EdgeInsets(0))
                        .listRowSeparator(.hidden)
                        
                        Section {
                            VStack(spacing: 0) {
                                HStack {
                                    Text("로그인 정보")
                                        .foregroundColor(.gray500)
                                        .font(.pretendard(.medium, size: 16))
                                    Spacer()
                                    setSnsType()
                                }
                                .padding([.top, .bottom], 20)
                                .padding([.leading, .trailing], 28)
                                HStack {
                                    Text("자동 로그인 사용")
                                        .foregroundColor(.gray500)
                                        .font(.pretendard(.medium, size: 16))
                                    Spacer()
                                    Toggle(isOn: self.$isOnAutoLogIn) {
                                    }
                                    .tint(Color.black)
                                }
                                .padding([.top, .bottom], 20)
                                .padding([.leading, .trailing], 28)
                                makeGraySpacing()
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(0))

                        Section {
                            VStack(spacing: 0) {
                                HStack {
                                    Text("푸쉬 알림 설정")
                                        .foregroundColor(.gray500)
                                        .font(.pretendard(.medium, size: 16))
                                    Spacer()
                                    Toggle(isOn: self.$isOnPushAlert) {
                                    }.tint(Color.black)
                                }
                                .padding([.top, .bottom], 20)
                                .padding([.leading, .trailing], 28)
                                makeGraySpacing()
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(0))
                        
                        Section {
                            HStack {
                                Text("버전 정보")
                                    .foregroundColor(.gray500)
                                    .font(.pretendard(.medium, size: 16))
                                Spacer()
                              Text("\(settingViewModel.appVersion)")
                            }
                            .padding([.top, .bottom], 20)
                            .padding([.leading, .trailing], 28)
                            
                            NavigationLink(destination:
                                            TermsView(termsState: $termsViewState)
                                .navigationTitle("서비스 이용 약관")
                                .navigationBarTitleDisplayMode(.inline)
                            ) {
                                HStack {
                                    Text("서비스 이용 약관")
                                        .foregroundColor(.gray500)
                                        .font(.pretendard(.medium, size: 16))
                                }
                                .onTapGesture {
                                    termsViewState = .serviceUse
                                }
                            }
                            .padding([.top, .bottom], 20)
                            .padding([.leading, .trailing], 28)
                            
                            NavigationLink(destination: TermsView(termsState: $termsViewState)
                                .navigationTitle("개인정보 처리방침")
                                .navigationBarTitleDisplayMode(.inline)
                            ) {
                                HStack {
                                    Text("개인정보 처리방침")
                                        .foregroundColor(.gray500)
                                        .font(.pretendard(.medium, size: 16))
                                    Spacer()
                                }
                                .onTapGesture {
                                    termsViewState = .privacy
                                }
                            }
                            .padding([.top, .bottom], 20)
                            .padding([.leading, .trailing], 28)
                            VStack(spacing: 0) {
                                NavigationLink(destination: TermsView(termsState: $termsViewState)
                                    .navigationTitle("오픈소스 라이센스")
                                    .navigationBarTitleDisplayMode(.inline)
                                ) {
                                    HStack {
                                        Text("오픈소스 라이센스")
                                            .foregroundColor(.gray500)
                                            .font(.pretendard(.medium, size: 16))
                                        Spacer()
                                    }
                                    .onTapGesture {
                                        termsViewState = .openSourceLisence
                                    }
                                }
                                .padding([.top, .bottom], 20)
                                .padding([.leading, .trailing], 28)
                                makeGraySpacing()
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(0))
                        Section {
                            HStack {
                                Button(action: {
                                    isOnPopUp.toggle()
                                    popUpState = .logOut
                                }, label: {
                                    Text("로그아웃")
                                        .foregroundColor(.red500)
                                        .font(.pretendard(.medium, size: 16))
                                })
                                Spacer()
                                Image("Setting_arrow")
                            }
                            .padding([.top, .bottom], 20)
                            .padding([.leading, .trailing], 28)
                            VStack(spacing: 0) {
                                HStack {
                                    Button(action: {
                                        isOnPopUp.toggle()
                                        popUpState = .withDraw
                                    }, label: {
                                        Text("탈퇴하기")
                                            .foregroundColor(.gray400)
                                            .font(.pretendard(.medium, size: 16))
                                    })
                                    Spacer()
                                    Image("Setting_arrow")
                                }
                                .padding([.top, .bottom], 20)
                                .padding([.leading, .trailing], 28)
                                Rectangle()
                                    .foregroundColor(.gray100)
                                    .frame(height: 134)
                                    .ignoresSafeArea()
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(0))
                    } // list End
                    .environment(\.defaultMinListRowHeight, 60)
                    .background(Color.gray100.edgesIgnoringSafeArea(.bottom))
                } // VStack End
                .navigationTitle("설정")
                .listStyle(.plain)
                if isOnPopUp {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                    VStack {
                        Spacer()
                      SettingPopUpView(viewModel: $settingViewModel, isVisible: $isOnPopUp, popUpState: $popUpState, isShowingToastMessage: $isShowingToastMessage)
                        Spacer()
                    }
                    .edgesIgnoringSafeArea(.all)
                }
                if isShowingToastMessage {
                    Text("탈퇴 완료")
                        .foregroundColor(Color.white)
                        .font(.pretendard(.medium, size: 22))
                        .padding()
                        .background(Color.black)
                        .cornerRadius(15)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                isShowingToastMessage.toggle()
                            }
                        }
                }
            }
            // Zstack End
        } // NavigationView End
        .accentColor(.black)
    } // body end
    
    @ViewBuilder
    private func setSnsType() -> some View {
        switch(settingViewModel.checkSnsType()) {
        case .KAKAO:
            Image("LogInInfo_Kakao")
        case .APPLE:
            Image("LogInInfo_Apple")
        case .NONE:
            Image("")
        }
    }
    
    @ViewBuilder
    private func makeGraySpacing() -> some View {
        Rectangle()
            .foregroundColor(.gray100)
            .frame(height: 15)
    }
}


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
