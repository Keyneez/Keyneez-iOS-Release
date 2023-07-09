//
//  DetailTagView.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/07/09.
//

import SwiftUI

enum DetailTagState {
    case hobby // 취미
    case culture // 문화생활
    case course // 진로
    case speech // 강연
    case lecture // 강의
    case mentoring // 멘토링
    case activity // 활동
    case supporters // 서포터즈
    case club // 동아리
    case campaign // 캠페인
    case competition // 공모전
}

struct DetailTagView: View {
    private var tag: DetailTagState
    
    var body: some View {
        switch self.tag {
        case .hobby:
            Text("취미")
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.gray050)
                .background(Color.mint500)
                .cornerRadius(53)
        case .culture:
            Text("문화생활")
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.mint500)
                .overlay(
                    RoundedRectangle(cornerRadius: 53)
                        .stroke(Color.mint500, lineWidth: 1)
                )
        case .course:
            Text("진로")
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.gray050)
                .background(Color.red500)
                .cornerRadius(53)
        case .speech:
            Text("강연")
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.red500)
                .overlay(
                    RoundedRectangle(cornerRadius: 53)
                        .stroke(Color.red500, lineWidth: 1)
                )
        case .lecture:
            Text("강의")
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.red500)
                .overlay(
                    RoundedRectangle(cornerRadius: 53)
                        .stroke(Color.red500, lineWidth: 1)
                )
        case .mentoring:
            Text("멘토링")
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.red500)
                .overlay(
                    RoundedRectangle(cornerRadius: 53)
                        .stroke(Color.red500, lineWidth: 1)
                )
        case .activity:
            Text("활동")
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.gray050)
                .background(Color.purple500)
                .cornerRadius(53)
        case .supporters:
            Text("서포터즈")
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.purple500)
                .overlay(
                    RoundedRectangle(cornerRadius: 53)
                        .stroke(Color.purple500, lineWidth: 1)
                )
        case .club:
            Text("동아리")
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.purple500)
                .overlay(
                    RoundedRectangle(cornerRadius: 53)
                        .stroke(Color.purple500, lineWidth: 1)
                )
        case .campaign:
            Text("캠페인")
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.purple500)
                .overlay(
                    RoundedRectangle(cornerRadius: 53)
                        .stroke(Color.purple500, lineWidth: 1)
                )
        case .competition:
            Text("공모전")
                .font(.pretendard(.medium, size: 16))
                .padding([.leading, .trailing], 11)
                .padding([.top, .bottom], 5)
                .foregroundColor(.purple500)
                .overlay(
                    RoundedRectangle(cornerRadius: 53)
                        .stroke(Color.purple500, lineWidth: 1)
                )
        }
    }
    
    init(tag: DetailTagState) {
        self.tag = tag
    }
}

struct DetailTagView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTagView(tag: .competition)
    }
}
