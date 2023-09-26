//
//  HomeModels.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/09/26.
//

import Foundation
import SwiftUI

enum Views: Hashable {
    
    case HomeView
    case JellyView
    case MainRecommendView
    
}


class Router: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func clear() {
        path = .init()
    }
    
    func gotoJellyView() {
        path.append(Views.JellyView)
    }
    
    func gotoMainRecommendView() {
        path.append(Views.MainRecommendView)
    }
    
}

enum ViewFactory {
    
    @ViewBuilder
    static func viewForDestination(_ destination: Views) -> some View {
        
        switch destination {
            
        case .HomeView:
           EmptyView() 
            
        case .JellyView:
            JellyGifImageView()
            
        case .MainRecommendView:
            MainRecommendView()
        }
    }
}
