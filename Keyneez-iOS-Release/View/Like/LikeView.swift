//
//  LikeView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/06/26.
//

import SwiftUI

struct LikeView: View {
    @ObservedObject var viewModel: LikeViewModel
    @State private var ScrollViewOffset: CGFloat = 0
    @State private var StartOffset: CGFloat = 0
    @State private var isNavigationBarHidden = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.gray100
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            NavigationLink(destination: LikeEditView(viewModel: LikeViewModel())) {
                               Text("편집")
                                    .font(.pretendard(.medium, size: 18))
                                    .foregroundColor(.gray500)
                            }
                        }
                        .padding(.horizontal, 24.adjusted)
                        Spacer().frame(height: 14.adjusted)
                        Text("좋아요")
                            .font(.pretendard(.semiBold, size: 24))
                            .padding(.leading, 28)
                        Spacer().frame(height: 30.adjusted)
                        FilterTagView()
                            .padding(.leading, 24.adjusted)
                        Spacer().frame(height: 19.adjusted)
                        Text("총 \(viewModel.likeSelectedCellNumber)개")
                            .font(.pretendard(.semiBold, size: 15))
                            .padding(.leading, 24.adjusted)
                        Spacer().frame(height: 14.adjusted)
                      LikeCellView(viewModel: LikeViewModel())
                        //MARK: - 셀 개수 받아서 높이 계산해주는 함수 필요
                        .frame(height: 800)
                    }
                    .overlay(
                        GeometryReader { proxy -> Color in
                            DispatchQueue.main.async {
                                if StartOffset == 0 {
                                    self.StartOffset = proxy.frame(in: .global).minY
                                }
                                let offset = proxy.frame(in: .global).minY
                                self.ScrollViewOffset = offset - StartOffset
                            }
                            return Color.clear
                            }
                            .frame(width: 0, height: 0)
                        ,alignment: .top
                    
                    )
                }
              
                
                .overlay(
                CustomNavigationBarView()
                    .ignoresSafeArea(.all)
                    .opacity(-ScrollViewOffset > 10 ? 1 : 0)
                    .animation(.easeIn)
                ,alignment: .top
                )
                
            }
            .scrollIndicators(.hidden)
            .background(Color.gray100)
           
        }
    }
}



extension LikeView {
    struct CustomNavigationBarView: View {
        var body: some View {
            VStack(spacing:0) {
                ZStack(alignment: .bottom) {
                    Color.navigationColor
                        .edgesIgnoringSafeArea(.all)
                    HStack(alignment: .center) {
                        Spacer()
                        Text("좋아요")
                            .font(.pretendard(.semiBold, size: 18))
                            .foregroundColor(.gray900)
                            .padding(.leading, 24.adjusted)
                        Spacer()
                        NavigationLink(destination: LikeEditView(viewModel: LikeViewModel())) {
                            Text("편집")
                                 .font(.pretendard(.medium, size: 18))
                                 .foregroundColor(.gray500)
                        }
                    }
                    .padding(.horizontal, 24.adjusted)
                    .padding(.bottom, 12.adjusted)
                }
                Color.gray400
                    .frame(height: 0.5)
                    .opacity(0.4)
            }
            .frame(height: 100.adjusted)
        }
    }
}
struct LikeView_Previews: PreviewProvider {
    static var previews: some View {
        LikeView(viewModel: LikeViewModel())
    }
}
