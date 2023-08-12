//
//  LikeEditView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/07.
//

import SwiftUI

struct LikeEditView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: LikeViewModel
    
    var body: some View {
        ZStack {
            Color.gray100
                .ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Spacer()
                    Text("삭제할 활동 선택")
                        .font(.pretendard(.semiBold, size: 18))
                        .foregroundColor(.gray900)
                        .padding(.leading, 14.adjusted)
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("취소")
                            .font(.pretendard(.medium, size: 18))
                    })
                    .foregroundColor(.gray500)
                }
                .padding(.horizontal, 14.adjusted)
                
                Spacer().frame(height: 28.adjusted)
                ScrollView {
                    VStack(alignment: .leading) {
                        FilterTagView()
                            .padding(.leading, 24.adjusted)
                        Spacer().frame(height: 19.adjusted)
                        Text("\(viewModel.likeEditSelectedCellNumber)개 선택")
                            .font(.pretendard(.semiBold, size: 15))
                            .foregroundColor(.gray900)
                            .padding(.leading, 28.adjusted)
                        Spacer().frame(height: 14.adjusted)
                      LikeEditGridView(viewModel: LikeViewModel())
                        //MARK: - 셀 개수 받아서 높이 계산해주는 함수 필요
                            .frame(height: 800)
                    }
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
    struct LikeEditGridView: View {
      @ObservedObject var viewModel: LikeViewModel

        var columns: [GridItem] = [
            GridItem(.flexible(), spacing: 14), // 가로 간격 설정
            GridItem(.flexible())
        ]
        
        var body: some View {
            LazyVGrid(columns: columns, spacing: 17) {
                ForEach((0...5), id: \.self ) { index in
                    ZStack(alignment: .topLeading) {
                      ExploreCardViewCell(item: viewModel.items[index])
                    }
                }
            }
            .padding([.leading, .trailing], 22)
        }
    }
}

struct LikeEditView_Previews: PreviewProvider {
    static var previews: some View {
        LikeEditView(viewModel: LikeViewModel())
    }
}
