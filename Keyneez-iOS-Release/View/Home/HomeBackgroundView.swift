//
//  HomeBackgroundView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/07.
//

import SwiftUI

struct HomeBackgroundView: View {
    var body: some View {
      Rectangle()
        .foregroundColor(.clear)
        .background(
          LinearGradient(
            stops: [
              Gradient.Stop(color: .mainBackground1, location: 0.00),
              Gradient.Stop(color: .mainBackground2, location: 1.00),
            ],
            startPoint: UnitPoint(x: 0.5, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 1)
          )
        )
    }
}

struct HomeBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBackgroundView()
    }
}

