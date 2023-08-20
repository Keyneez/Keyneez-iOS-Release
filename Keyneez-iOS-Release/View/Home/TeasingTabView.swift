//
//  TeasingTabView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/08.
//

import SwiftUI

struct TeasingTabView: View {
  @Binding var selectedTab: Int
  let spacing: CGFloat
  @StateObject private var viewModel = RecommendContentViewModel()
  @State private var offset = CGFloat.zero
  
  var body: some View {
    VStack {
      GeometryReader { geo in
        let screenSize = geo.size
        let width = geo.size.width * 0.7
        
        HStack(spacing: spacing) {
          Color.clear
            .frame(width: max(geo.size.width * 0.15 - spacing, 0))
          ForEach(viewModel.recommendContentList, id: \.contentPk) { content in
            RecommendCardViewCell(screenSize: screenSize, width: width, model: content)
              .frame(width: width)
              .onTapGesture {
                selectedTab = content.contentPk
              }
              .foregroundColor(content.contentPk == selectedTab ? .primary : .secondary.opacity(0.5))
          }
        }
        .offset(x: CGFloat(-selectedTab) * (width + spacing) + offset)
        .animation(.easeOut, value: selectedTab)
        .gesture(
          DragGesture()
            .onChanged { value in
              offset = value.translation.width
            }
            .onEnded { value in
              withAnimation(.easeIn) {
                offset = value.predictedEndTranslation.width
                selectedTab -= Int((offset / width).rounded())
                selectedTab = max(0, min(selectedTab, viewModel.recommendContentList.count - 1))
                offset = 0
              }
            }
        )
      }
      
      HStack {
        ForEach(viewModel.recommendContentList, id: \.contentPk) { content in
          Circle()
            .frame(width: 8)
            .foregroundColor( content.contentPk == selectedTab ? .primary : .secondary.opacity(0.5))
            .onTapGesture {
              selectedTab = content.contentPk
            }
        }
      }
    }
    .onAppear {
      viewModel.fetchRecommendContent()
    }
  }
}
