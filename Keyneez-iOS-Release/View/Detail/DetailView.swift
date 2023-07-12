//
//  DetailView.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/06/22.
//

import SwiftUI
// TODO: - 이 뷰 불러오는 NavigationView에서 네비게이션 바 .accentColor(.black)

struct DetailView: View {
    @StateObject private var detailViewModel = DetailViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                ZStack {
                    VStack {
                        Image(detailViewModel.setDetailImage())
                            .resizable()
                            .scaledToFit()
                        
                        Spacer()
                    }
                    .ignoresSafeArea()
                    ZStack {
                        RoundedRectangle(cornerRadius: 60)
                            .foregroundColor(.white)
                            .ignoresSafeArea()
                            .padding(.top, 286)
                        VStack() {
                            VStack(alignment: .leading) {
                                HStack {
                                    makeTagView(detailViewModel.tagList)
                                    Spacer()
                                    Image("emptyHeart")
                                }
                                Spacer()
                                    .frame(height: 29)
                                Text("현대카드 라이브러리")
                                    .font(.pretendard(.bold, size: 24))
                                    .frame(alignment: .leading)
                                    .foregroundColor(.gray800)
                                Spacer()
                                    .frame(height: 17)
                                HStack {
                                    Text("날짜")
                                        .font(.pretendard(.medium, size: 14))
                                        .foregroundColor(.gray400)
                                    Spacer()
                                        .frame(width: 20)
                                    Text("2020.04.05")
                                        .font(.pretendard(.medium, size: 14))
                                        .foregroundColor(.gray500)
                                }
                                Spacer()
                                    .frame(height: 6)
                                HStack {
                                    Text("위치")
                                        .font(.pretendard(.medium, size: 14))
                                        .foregroundColor(.gray400)
                                    Spacer()
                                        .frame(width: 20)
                                    Text("서울 용산구 이태원로 46")
                                        .font(.pretendard(.medium, size: 14))
                                        .foregroundColor(.gray500)
                                }
                                Spacer()
                                    .frame(height: 36)
                            }
                            .padding([.top, .leading, .trailing], 28)
                            
                            Rectangle()
                                .frame(height: 19)
                                .foregroundColor(.gray100)
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("활동 설명")
                                        .font(.pretendard(.semiBold, size: 20))
                                        .foregroundColor(.gray700)
                                    Spacer()
                                        .frame(height: 17)
                                    Text("・"+"설명설명설 명설명설명설명설명 설명설명설명 설명설명 설명설 명설명 설명")
                                        .font(.pretendard(.medium, size: 14))
                                        .foregroundColor(.gray500)
                                }
                                Spacer()
                            }
                            .padding([.top, .leading, .trailing], 28)
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray400)
                                .padding([.leading, .trailing], 16)
                                .padding([.top], 30)
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("참가비(입장료)")
                                        .font(.pretendard(.semiBold, size: 20))
                                        .foregroundColor(.gray700)
                                    Spacer()
                                        .frame(height: 17)
                                    Text("・ 성인 1인 15,000원\n・ 청소년 1인 10,000원\n・ 3살 이하 영유아 무료")
                                        .font(.pretendard(.medium, size: 14))
                                        .foregroundColor(.gray500)
                                }
                                Spacer()
                            }
                            .padding([.top, .leading, .trailing], 28)
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray400)
                                .padding([.leading, .trailing], 16)
                                .padding([.top], 30)
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("청소년 혜택")
                                        .font(.pretendard(.semiBold, size: 20))
                                        .foregroundColor(.gray700)
                                    Spacer()
                                        .frame(height: 17)
                                    Text("・ 5% 티켓 가격 할인\n・ 5% 음식 가격 할인")
                                        .font(.pretendard(.medium, size: 14))
                                        .foregroundColor(.gray500)
                                }
                                Spacer()
                            }
                            .padding([.top, .leading, .trailing], 28)
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray400)
                                .padding([.leading, .trailing], 16)
                                .padding([.top], 30)
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("문의 정보")
                                        .font(.pretendard(.semiBold, size: 20))
                                        .foregroundColor(.gray700)
                                    Spacer()
                                        .frame(height: 17)
                                    Text("・ "+"현대카드 고객센터 0101-0101")
                                        .font(.pretendard(.medium, size: 14))
                                        .foregroundColor(.gray500)
                                    Spacer()
                                        .frame(height: 30)
                                }
                                Spacer()
                            }
                            .padding([.top, .leading], 28)
                            .padding(.bottom, 124)
                        } // VStack End
                        .padding(.top, 286)
                    } // ZStack End
                }
            }
            .ignoresSafeArea()
            
            // button
            ZStack {
                VStack {
                    Spacer()
                    Rectangle()
                        .frame(height: 170)
                        .foregroundColor(.white)
                        .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .clear]), startPoint: .bottom, endPoint: .top))
                }
                .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Button {
                        // action
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 14)
                                .frame(height: 56)
                                .padding(34)
                                .foregroundColor(.black)
                            Text("신청하러 가기")
                                .foregroundColor(.white)
                                .font(.pretendard(.medium, size: 18))
                            // TODO: URL 연결
                        }
                    }
                }
            }
        } // ScrollView End
        .toolbar {
            ToolbarItem {
                Button {
                    // share button action
                } label: {
                    Image("Detail_Share")
                }
            }
        }
        .background(.white)
        .onAppear {
            // TODO: - 구현...
            Task {
                await detailViewModel.getDetailContent()
            }
        }
    } // 제일 밖 ZStack End
}

extension DetailView {
    func makeTagView(_ tagList: [DetailTagState]) -> some View {
        ForEach(0..<tagList.count) { index in
            DetailTagView(tag: tagList[index])
            Spacer()
                .frame(width: 10)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
