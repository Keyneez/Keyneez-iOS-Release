//
//  LikeEditView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/07.
//

import SwiftUI

struct LikeEditView: View {
  @Environment(\.dismiss) private var dismiss
  @ObservedObject private var likeCardViewModel = LikedCardViewModel()
  @ObservedObject private var viewModel = LikeViewModel()
  @Binding var cardList : [ContentsLikedResponseDTO]
  @Binding var isAlertVisible: Bool
  
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
//            likedFilterTagView(viewModel: likeCardViewModel,
//                               selectedButton: $viewModel.likeSelectedButton)
//              .padding(.leading, 24.adjusted)
            Spacer().frame(height: 19.adjusted)
            Text("\(viewModel.selectedContentPks.count)개 선택")
              .font(.pretendard(.semiBold, size: 15))
              .foregroundColor(.gray900)
              .padding(.leading, 28.adjusted)
            Spacer().frame(height: 14.adjusted)
            LikeEditCell(cardList: $cardList,
                         viewModel: viewModel)
            Spacer()
          }
        }
        Button(action: {
          likeCardViewModel.fetchPostUnlikedCard(pk: Array(viewModel.selectedContentPks))
          cardList.removeAll { content in
            viewModel.selectedContentPks.contains(content.contentPk)
             }
          isAlertVisible = true
          dismiss()
        }) {
          Text("삭제하기")
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(17 * 3/4)
        }
        .buttonStyle(.borderedProminent)
        .tint(updateDeleteButton())
        .padding(.horizontal, 22)
        .disabled(!isConfirmed())
      }
    }
    .toolbar(.hidden, for: .tabBar)
    .navigationBarBackButtonHidden(true)
    .onAppear {
      likeCardViewModel.fetchGetLikedCard(filter: nil)
    }
    .onDisappear {
      viewModel.selectedContentPks.removeAll()
      viewModel.state = .isCompleted(false)
    }
  }
}

extension LikeEditView {
  private func updateDeleteButton() -> Color {
    return isConfirmed() ? .gray900 : .gray400
  }

  private func isConfirmed() -> Bool {
    switch viewModel.state {
    case  .isCompleted(true):
      return true
    case .isCompleted(false):
      return false
    }
  }
}

