//
//  TagView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/06/27.
//

import SwiftUI

struct CardTagView: View {
    @State private var textSize: CGSize = .zero
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundColor(.mint500)
                .cornerRadius(53)
                .frame(width: textSize.width + 7, height: textSize.height + 3.5)
            Text("취미")
                .foregroundColor(.gray050)
                .font(.pretendard(.medium, size: 10))
                .background(
                  //Text background 사이즈 송신
                    GeometryReader { geometry in
                        Color.clear
                            .preference(
                                key: SizePreferenceKey.self,
                                value: geometry.size
                            )
                    }
                )
                //Text background 사이즈 수신
                .onPreferenceChange(SizePreferenceKey.self) { textSize = $0 }
        }
    }
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        let newSize = nextValue()
        value = CGSize(
          width: newSize.width,
          height: newSize.height
        )
    }
}


struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        CardTagView()
    }
}

