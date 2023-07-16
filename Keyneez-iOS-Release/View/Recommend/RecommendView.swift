//
//  RecommendView.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 6/5/23.
//

import SwiftUI

struct RecommendView: View {
  var items: [RecommendItem] = makeRecommendItems()
  var itemImageIndices = [2, 1, 8, 4, 1, 6]
  @StateObject var viewModel: RecommendViewModel
  @Binding var overPreviousView: Bool
  @Binding var popToRoot: Bool
  
  private let gridLayout = [
    GridItem(.flexible(), spacing: 15),
    GridItem(.flexible(), spacing: 15)
  ]
  
    var body: some View {
      VStack {
        VStack(alignment: .leading) {
          Spacer().frame(height:32 * 3/4)
          Text("\(viewModel.nickname)님께\n딱 맞는 정보를 추천해 드릴게요!")
            .font(.system(size: 24, weight: .bold))
          Spacer().frame(height: 24 * 3/4)
          Text("선호하는 카테고리를 최대 3개까지 골라주세요")
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.gray)
          Spacer().frame(height: 30 * 3/4)
          LazyVGrid(columns: gridLayout, spacing: 15) {
            ForEach(viewModel.items.indices, id: \.self) {
              index in
                ZStack(alignment: .topLeading) {
                  Button {
                    viewModel.action(.onTapFilter(id: index))
                  } label: {
                    ZStack {
                      Image("recommend_\(itemImageIndices[index])")
                    }
                  }
                  .buttonStyle(.plain)
                  
                  RecommendCell(item: viewModel.items[index])
                  if viewModel.items[index].checked == true {
                    ZStack(alignment: .topTrailing) {
                      Button {
                        viewModel.action(.onTapFilter(id: index))
                      } label: {
                        Rectangle().foregroundColor(.black
                          .opacity(0.3))
                      }
                      Image("on")
                        .offset(x: -11, y: 12)
                    }
                  }
                }
                  .frame(maxWidth: .infinity, minHeight: 144)
                  .cornerRadius(30)
            }
          }
        }
        .padding(.horizontal, 24)
        Spacer()
        Button(action: {
          viewModel.action(.onTapConfirmButton)
        }) {
          Text("키니즈 시작하기")
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(17 * 3/4)
        }
        .buttonStyle(.borderedProminent)
        .tint(updateConfirmButton())
        .padding(.horizontal, 22)
        .disabled(!isConfirmed())
        navigation()
      }
      .navigationBarBackButtonHidden(true)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button(action: {
            overPreviousView = false
          }) {
            Image(systemName: "chevron.left").renderingMode(.template)
              .foregroundColor(.black)
          }
        }
      }
      .errorAlert(error: $viewModel.error, completion: {
        self.popToRoot = false
        
      })
      .background(Color(hex: 0xF7F7F7, opacity: 1))
    }
}

extension RecommendView {
  
  @ViewBuilder
  private func navigation() -> some View {
    NavigationLink(destination: TabBarView(), isActive: $viewModel.confirmed) {
      EmptyView()
    }
  }
  
  private func updateConfirmButton() -> Color {
    return isConfirmed() ? .black : .gray
  }
  
  private func isConfirmed() -> Bool {
    switch viewModel.state {
    case let .isCompleted(ok):
      return ok
    }
  }
}

struct RecommendView_Previews: PreviewProvider {
    static var previews: some View {
      RecommendView(viewModel: RecommendViewModel(idToken: nil, kakaoAccessToken: nil, nickname: "", gender: .man, birth: ""), overPreviousView: .constant(false), popToRoot: .constant(false))
    }
}
