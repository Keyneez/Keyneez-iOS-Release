//
//  SettingView.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/06/03.
//

import SwiftUI

// TODO: - PopUp 뷰 부드럽게 애니메이션

// TODO: - 이용약관 동의하기 버튼 누르면 닫히도록
// TODO: - 이용약관 네비게이션 화살표 색상 변경

// TODO: - 버튼 touch 영역 수정
struct SettingView: View {
    
    @State private var isOnAutoLogIn = false
    @State private var isOnPushAlert = false
    @State private var isOnPopUp = false
    @State private var popUpState = SettingPopUpState.logOut
    @State private var termsViewState = TermsViewState.serviceUse
    @State private var isLogOut = false // 임시변수 -> User로 대체
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Pretendard-SemiBold", size: 26)!]
        // TODO: padding leading 값 28로 변경
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        Section() {
                            VStack(alignment: .leading, spacing: 0) {
                                HStack() {
                                    Text("민지너는최고")
                                        .foregroundColor(.gray900)
                                        .font(.pretendard(.semiBold, size: 20))
                                        .fontWeight(.semibold)
                                }
                                .padding(.bottom, 20)
                                .padding(.top, 48)
                                .padding([.leading], 28)
                                Rectangle()
                                    .foregroundColor(.gray100)
                                    .frame(height: 15)
                            }
                        }
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                        
                        Section() {
                            VStack(spacing: 0) {
                                HStack {
                                    Text("로그인 정보")
                                        .foregroundColor(.gray500)
                                        .font(.pretendard(.medium, size: 16))
                                    Spacer()
                                    // TODO: - 로그인 정보에 따라 카카오 / 애플 변경
                                    Image("LogInInfo_Kakao")
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
                                Rectangle()
                                    .foregroundColor(.gray100)
                                    .frame(height: 15)
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
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
                                
                                Rectangle()
                                    .foregroundColor(.gray100)
                                    .frame(height: 15)
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        Section {
                            HStack {
                                Text("버전 정보")
                                    .foregroundColor(.gray500)
                                    .font(.pretendard(.medium, size: 16))
                                Spacer()
                                Text("1.0.1") // TODO: - 버전 정보 변수로 변경
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
                                
                                Rectangle()
                                    .foregroundColor(.gray100)
                                    .frame(height: 15)
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Section {
                            HStack {
                                Button(action: {
                                    isOnPopUp.toggle()
                                    // logout action
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
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
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
                        SettingPopUpView(isVisible: $isOnPopUp, popUpState: $popUpState, userLogout: $isLogOut)
                        Spacer()
                    }
                    .edgesIgnoringSafeArea(.all)
                }
                if isLogOut {
                    Text("탈퇴 완료")
                        .foregroundColor(Color.white)
                        .font(.pretendard(.medium, size: 22))
                        .padding()
                        .background(Color.black)
                        .cornerRadius(15)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                isLogOut.toggle()
                            }
                        }
                }
            }
            // Zstack End
        } // NavigationView End
    } // body end
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
