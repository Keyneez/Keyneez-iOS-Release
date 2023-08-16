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

struct FilterTagView: View {
  @State private var selectedButton: FilterTagType? = .all
    
    var body: some View {
        HStack(spacing: 9) {
            ForEach(FilterTagType.allCases, id: \.self) { buttonType in
                Button(action: {
                    selectedButton = buttonType
                }) {
                    Text(buttonType.rawValue)
                    .foregroundColor(selectedButton == buttonType ? .gray050 : .gray400)
                    .font(.pretendard(.regular, size: 16))
                    .padding()
                }
                .background(selectedButton == buttonType ? Color.gray900 : Color.gray200)
                .frame(width: 64, height: 35)
                .cornerRadius(10)
            }
        }
    }
}
