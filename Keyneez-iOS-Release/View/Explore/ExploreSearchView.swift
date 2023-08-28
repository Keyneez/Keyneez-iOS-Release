//
//  ExploreSearchView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/27.
//

import SwiftUI

struct ExploreSearchView: View {
  @ObservedObject var viewModel = ExploreViewModel()
  @StateObject var searchViewModel = SearchCardViewModel()
  
  var body: some View {
    VStack {
      ZStack(alignment: .top) {
        Color.gray100
          .ignoresSafeArea(.all)
        ScrollView {
          Spacer().frame(height: 86)
          VStack(spacing: 17) {
            Text("검색결과 \(searchViewModel.searchCardList.count)개")
              .font(.pretendard(.semiBold, size: 15))
            ExploreCardView(cardList: searchViewModel.searchCardList)
          }
          .frame(height: calculateTotalHeight(itemCount: searchViewModel.searchCardList.count,
                                              itemHeight: 258,
                                              spacing: 17))
        }
        ExploreSearchTopView(searchViewModel: searchViewModel)
          .frame(height: 50)
      }
      
    }
    .onAppear {
      searchViewModel.fetchSearchCard(keyword: "$#@")
    }
    .navigationBarBackButtonHidden(true)
  }
  
  struct ExploreSearchTopView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    @Environment(\.dismiss) private var dismiss
    @State private var searchKey = ""
    @ObservedObject var searchViewModel: SearchCardViewModel
    
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
            TextField("제목,키워드", text: $searchKey, onCommit: {
              let keyword = searchKey.isEmpty ? "@#$" : searchKey
              searchViewModel.fetchSearchCard(keyword: keyword)
            })
            Spacer()
            Button(action: {
              dismiss()
            }, label: {
              Text("취소")
                .font(.pretendard(.medium, size: 18))
            })
            .foregroundColor(.gray900)
            
          }
          .padding(.horizontal, 24)
        }
        Color.gray400
          .frame(height: 0.7)
      }
    }
  }
}

struct ExploreSearchView_Previews: PreviewProvider {
  static var previews: some View {
    ExploreSearchView()
  }
}

