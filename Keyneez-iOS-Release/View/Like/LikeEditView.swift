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
            FilterTagView()
              .padding(.leading, 24.adjusted)
            Spacer().frame(height: 19.adjusted)
            Text("\(viewModel.likeEditSelectedCellNumber)개 선택")
              .font(.pretendard(.semiBold, size: 15))
              .foregroundColor(.gray900)
              .padding(.leading, 28.adjusted)
            Spacer().frame(height: 14.adjusted)
            LikeEditGridView(viewModel: viewModel)
            Spacer().frame(height: 32.adjusted)
            Button(action: {
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
      }
    }
    .toolbar(.hidden, for: .tabBar)
    .navigationBarBackButtonHidden(true)
  }
  
  struct LikeEditGridView: View {
    @ObservedObject var viewModel: LikeViewModel
    
    var columns: [GridItem] = [
      GridItem(.flexible(), spacing: 14),
      GridItem(.flexible())
    ]
    
    var body: some View {
      LazyVGrid(columns: columns, spacing: 17) {
        ForEach(viewModel.items.indices, id: \.self ) { index in
          ZStack(alignment: .topLeading) {
            Button {
              viewModel.action(.onTapCardCellButton(id: index))
            } label: {
              ZStack(alignment: .topTrailing) {
                ExploreCardViewCell(item: viewModel.items[index])
                if viewModel.items[index].checked == true {
                  Color.gray900.opacity(0.3)
                    .cornerRadius(16)
                  Image("on")
                    .offset(x: -11, y: 12)
                }
              }
            }
          }
        }
      }
      .padding(.horizontal, 22)
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

