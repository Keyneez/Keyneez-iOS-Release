//
//  DetailViewModel.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/07/09.
//

import Foundation
import SwiftUI
import Moya

class DetailViewModel: ObservableObject {
    @Published var detailViewImage: String = "Detail_Activity_01"
    var tagList: [DetailTagState] = [.activity, .club] // 만약 서버에서 스트링 형태로 들어오면 여기다 태그들 추가하고
    // TODO: tagList [] 로 초기화하고 서버에서 받아온 값 넣어주는 코드 작성 (tagList.append(.course) 하는 작업)
    
    func setDetailImage() -> String {
        switch tagList.last {
        case .hobby, .culture:
            return "Detail_Hobby"
        case .course:
            return "Detail_Vision_04"
        case .speech:
            return "Detail_Vision_01"
        case .lecture:
            return "Detail_Vision_02"
        case .mentoring:
            return "Detail_Vision_03"
        case .activity, .supporters:
            return "Detail_Activity_01"
        case .club:
            return "Detail_Activity_02"
        case .campaign:
            return "Detail_Activity_03"
        case .competition:
            return "Detail_Activity_04"
        case .none:
            return ""
        }
        // 서버에서 받아온 태그에 따라 DetailTagState 설정
        // 받아온 String 값에 따라 case 분류
        // 태그는 1개 혹은 2개..
        // 마지막 태그에 따라 이미지 결정
    }
    
    func getDetailContent() async -> Result<Response, MoyaError> {
        let provider = MoyaProvider<DetailAPI>()
        let token = "938460"
        let response = await provider.request(.getDetailContents(accessToken: token, contentId: 0))
        print(response)
        return response

        // TODO: 여기 구현
    }
    // URL을 이용한 request를 통해 그 JSON 형태의 데이터를 Dto 형식으로 받아오는건데, (1) Dto를 만들기 (2) get...어찌구 함수를 이용해서 실행시킨다음에 받아온 Dto를 바탕으로 View에 업데이트해주기
}
// TODO: - 서버와 연동해서 태그에 따라 이미지 변경
