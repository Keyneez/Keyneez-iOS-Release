//
//  DetailView.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/06/22.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var detailViewModel = DetailViewModel()
  private var pk: Int
  @State private var title = "타이틀"
  
  init(pk: Int) {
      self.pk = pk
  }
    
    var body: some View {
        ZStack {
            ScrollView {
                ZStack {
                    VStack {
                      Image(detailViewModel.detailContent.imgName)
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
                                  makeTagView(detailViewModel.detailContent.category)
                                  makeTagView(detailViewModel.detailContent.tag ?? "")
                                    Spacer()
                                    Image("emptyHeart")
                                }
                                Spacer()
                                    .frame(height: 29)
                              Text(detailViewModel.detailContent.title)
                                .lineLimit(2)
                                    .font(.pretendard(.bold, size: 24))
                                    .frame(alignment: .leading)
                                    .foregroundColor(.gray800)
                                    .fixedSize(horizontal: false, vertical: true)
                                Spacer()
                                    .frame(height: 17)
                                HStack {
                                    Text("날짜")
                                        .font(.pretendard(.medium, size: 14))
                                        .foregroundColor(.gray400)
                                    Spacer()
                                        .frame(width: 20)
                                  Text(detailViewModel.detailContent.periodString)
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
                                  Text(detailViewModel.detailContent.place)
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
                                  Text(detailViewModel.detailContent.introduction)
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
                                  Text(detailViewModel.makeMultipleLines(strings: detailViewModel.detailContent.price))
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
                                  Text(detailViewModel.makeMultipleLines(strings: detailViewModel.detailContent.benefit))
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
                                    Text(detailViewModel.makeMultipleLines(strings: detailViewModel.detailContent.inquiry))
                                        .font(.pretendard(.medium, size: 14))
                                        .foregroundColor(.gray500)
                                        .fixedSize(horizontal: false, vertical: true)
                                    Spacer()
                                        .frame(height: 90)
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
                  Link(destination: URL(string: detailViewModel.detailContent.link) ?? URL(string: "https://www.naver.com")!) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 14)
                                .frame(height: 56)
                                .padding(34)
                                .foregroundColor(.black)
                            Text("신청하러 가기")
                                .foregroundColor(.white)
                                .font(.pretendard(.medium, size: 18))
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
          detailViewModel.getDetailView(pk: pk)
          title = detailViewModel.detailContent.title
        }
    } // 제일 밖 ZStack End
}

extension DetailView {
    func makeTagView(_ tagValue: String) -> some View {
//        ForEach(0..<tagList.count) { index in
      return Group {
      DetailTagView(tag: tagValue)
      Spacer()
        .frame(width: 10)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
      DetailView(pk: 2)
    }
}
