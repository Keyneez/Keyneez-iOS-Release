//
//  DetailTagView.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/07/09.
//

import SwiftUI

struct DetailTagView: View {
    private var tag: String
    
    var body: some View {
        switch self.tag {
        case "취미":
            Text(tag)
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.gray050)
                .background(Color.mint500)
                .cornerRadius(53)
        case "문화생활":
            Text(tag)
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.mint500)
                .overlay(
                    RoundedRectangle(cornerRadius: 53)
                        .stroke(Color.mint500, lineWidth: 1)
                )
        case "진로":
            Text(tag)
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.gray050)
                .background(Color.red500)
                .cornerRadius(53)
        case "강연":
            Text(tag)
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.red500)
                .overlay(
                    RoundedRectangle(cornerRadius: 53)
                        .stroke(Color.red500, lineWidth: 1)
                )
        case "강의":
            Text(tag)
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.red500)
                .overlay(
                    RoundedRectangle(cornerRadius: 53)
                        .stroke(Color.red500, lineWidth: 1)
                )
        case "멘토링":
            Text(tag)
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.red500)
                .overlay(
                    RoundedRectangle(cornerRadius: 53)
                        .stroke(Color.red500, lineWidth: 1)
                )
        case "활동":
            Text(tag)
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.gray050)
                .background(Color.purple500)
                .cornerRadius(53)
        case "서포터즈":
            Text(tag)
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.purple500)
                .overlay(
                    RoundedRectangle(cornerRadius: 53)
                        .stroke(Color.purple500, lineWidth: 1)
                )
        case "동아리":
            Text(tag)
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.purple500)
                .overlay(
                    RoundedRectangle(cornerRadius: 53)
                        .stroke(Color.purple500, lineWidth: 1)
                )
        case "캠페인":
            Text(tag)
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.purple500)
                .overlay(
                    RoundedRectangle(cornerRadius: 53)
                        .stroke(Color.purple500, lineWidth: 1)
                )
        case "공모전":
            Text(tag)
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.purple500)
                .overlay(
                    RoundedRectangle(cornerRadius: 53)
                        .stroke(Color.purple500, lineWidth: 1)
                )
        default:
          Text("")
        }
    }
    
    init(tag: String) {
        self.tag = tag
    }
}

struct DetailTagView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTagView(tag: "진로")
    }
}
