//
//  RecommendView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/07/08.
//

import SwiftUI

struct TeasingTabView: View {
  
  @Binding var selectedTab: Int
  let spacing: CGFloat
  let views: () -> [AnyView]
  
  @State private var offset = CGFloat.zero
  var viewCount: Int { views().count }
  
  var body: some View {
    
    VStack(spacing: spacing) {
      GeometryReader { geo in
        let width = geo.size.width * 0.7
        
        LazyHStack(spacing: spacing) {
          Color.clear
            .frame(width: max(geo.size.width * 0.15 - spacing, 0))
          ForEach(0..<viewCount, id: \.self) { idx in
            views()[idx]
              .frame(width: width)
              .padding(.vertical)
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
              withAnimation(.easeOut) {
                offset = value.predictedEndTranslation.width
                selectedTab -= Int((offset / width).rounded())
                selectedTab = max(0, min(selectedTab, viewCount-1))
                offset = 0
              }
            }
        )
      }
      
      HStack {
        ForEach(0..<viewCount, id: \.self) { idx in
          Circle().frame(width: 8)
            .foregroundColor(idx == selectedTab ? .primary : .secondary.opacity(0.5))
            .onTapGesture {
              selectedTab = idx
            }
        }
      }
    }
  }
}
