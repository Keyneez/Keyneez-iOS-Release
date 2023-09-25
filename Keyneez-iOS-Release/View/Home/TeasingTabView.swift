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
  @StateObject private var viewModel = RecommendCardViewModel()
  @ObservedObject private var likeViewModel = LikedCardViewModel()
  @State private var offset = CGFloat.zero
  
  var body: some View {
    VStack {
      GeometryReader { geo in
        let screenSize = geo.size
        let width = geo.size.width * 0.7
        
        HStack(spacing: spacing) {
          Color.clear
            .frame(width: max(geo.size.width * 0.15 - spacing, 0))
          ForEach(viewModel.recommendCardList, id: \.contentPk) { content in
            RecommendCardCell(screenSize: screenSize, width: width, model: content)
              .frame(width: width)
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
                selectedTab = max(0, min(selectedTab, viewModel.recommendCardList.count - 1))
                offset = 0
              }
            }
        )
      }
      
      HStack {
        ForEach(0..<viewModel.recommendCardList.count, id: \.self) { idx in
          Circle()
            .frame(width: 8)
            .foregroundColor( idx == selectedTab ? .primary : .secondary.opacity(0.5))
        }
      }
    }
    .onAppear {
      viewModel.fetchRecommendCard()
    }
  }
}
