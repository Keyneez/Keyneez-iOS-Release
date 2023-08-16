//
//  ExploreSearchView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/27.
//

import SwiftUI

struct ExploreSearchView: View {
    @ObservedObject var viewModel: ExploreViewModel
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                Color.gray100
                    .ignoresSafeArea(.all)
                ScrollView {
                    Spacer().frame(height: 86)
                    VStack {
                        Text("검색결과 \(viewModel.exploreSearchNumber)개")
                            .font(.pretendard(.semiBold, size: 15))
                      ExploreSearchGridView(viewModel: CardViewModel())
                    }
                }
                    ExploreSearchTopView(viewModel: viewModel)
                    .frame(height: 50)
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    struct ExploreSearchTopView: View {
        @ObservedObject var viewModel: ExploreViewModel
        @Environment(\.dismiss) private var dismiss

        var body: some View {
            VStack(spacing:0) {
                ZStack {
                    Color.navigationColor
                        .edgesIgnoringSafeArea(.all)
                    HStack {
                        Image("ic_search")
                            .resizable()
                            .resizable()
                            .frame(width: 18, height: 18)
                        Spacer().frame(width: 20)
                        TextField("제목,키워드", text: $viewModel.serachKey)
                        Spacer()
                        Button(action: {
                            dismiss()
                        }, label: {
                            Text("취소")
                                .font(.pretendard(.medium, size: 18))
                        })
                        .foregroundColor(.gray900)
                        
                    }
                    .padding([.leading, .trailing], 24)
                }
                Color.gray400
                    .frame(height: 0.7)
            }
        }
    }
    
    struct ExploreSearchGridView: View {
      @StateObject var viewModel: CardViewModel
      
      var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 14), // 가로 간격 설정
        GridItem(.flexible())
      ]
      
      var body: some View {
        LazyVGrid(columns: columns, spacing: 17) {
          ForEach(viewModel.items.indices, id: \.self ) {index in
            ExploreCardViewCell(item: viewModel.items[index])
          }
        }
        .padding([.leading, .trailing], 22)
      }
    }
}

struct ExploreSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreSearchView(viewModel: ExploreViewModel())
    }
}

