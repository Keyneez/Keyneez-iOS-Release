//
//  ExploreFilterTagView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/04.
//

import SwiftUI

enum FilterTagType: String, CaseIterable {
  case all = "전체"
  case hobby = "취미"
  case activity = "활동"
  case career = "진로"
  
}

struct popularFilterTagView : View {
  @ObservedObject var viewModel: PopularityCardViewModel
  @Binding var selectedButton: FilterTagType
  
  var body: some View {
    HStack(spacing: 9) {
      ForEach(FilterTagType.allCases, id: \.self) { buttonType in
        Button(action: {
          selectedButton = buttonType
          updateFilterAndFetchData(filterType: buttonType)
        }) {
          Text(buttonType.rawValue)
            .foregroundColor(selectedButton == buttonType ? .gray050 : .gray400)
            .font(.pretendard(.regular, size: 16))
            .padding(.horizontal, 18)
            .padding(.vertical, 8)
            .background(selectedButton == buttonType ? Color.gray900 : Color.gray200)
            .cornerRadius(10)
        }
        .frame(width: 64, height: 35)
      }
    }
  }
}

struct recentFilterTagView : View {
  @ObservedObject var viewModel: AllCardViewModel
  @Binding var selectedButton: FilterTagType
  
  var body: some View {
    HStack(spacing: 9) {
      ForEach(FilterTagType.allCases, id: \.self) { buttonType in
        Button(action: {
          selectedButton = buttonType
          updateFilterAndFetchData(filterType: buttonType)
        }) {
          Text(buttonType.rawValue)
            .foregroundColor(selectedButton == buttonType ? .gray050 : .gray400)
            .font(.pretendard(.regular, size: 16))
            .padding(.horizontal, 18)
            .padding(.vertical, 8)
            .background(selectedButton == buttonType ? Color.gray900 : Color.gray200)
            .cornerRadius(10)
        }
        .frame(width: 64, height: 35)
      }
    }
  }
}

struct likedFilterTagView : View {
  @ObservedObject var viewModel: LikedCardViewModel
  @Binding var selectedButton: FilterTagType
  
  var body: some View {
    HStack(spacing: 9) {
      ForEach(FilterTagType.allCases, id: \.self) { buttonType in
        Button(action: {
          selectedButton = buttonType
          updateFilterAndFetchData(filterType: buttonType)
        }) {
          Text(buttonType.rawValue)
            .foregroundColor(selectedButton == buttonType ? .gray050 : .gray400)
            .font(.pretendard(.regular, size: 16))
            .padding(.horizontal, 18)
            .padding(.vertical, 8)
            .background(selectedButton == buttonType ? Color.gray900 : Color.gray200)
            .cornerRadius(10)
        }
        .frame(width: 64, height: 35)
      }
    }
  }
}


extension popularFilterTagView {
  private func updateFilterAndFetchData(filterType: FilterTagType) {
    let filter = filterType == .all ? nil : filterType.rawValue
    viewModel.fetchPopularityCard(filter: filter)
  }
}

extension recentFilterTagView {
  private func updateFilterAndFetchData(filterType: FilterTagType) {
    let filter = filterType == .all ? nil : filterType.rawValue
    viewModel.fetchAllCard(filter: filter)
  }
}

extension likedFilterTagView {
  private func updateFilterAndFetchData(filterType: FilterTagType) {
    let filter = filterType == .all ? nil : filterType.rawValue
    viewModel.fetchGetLikedCard(filter: filter)
  }}
