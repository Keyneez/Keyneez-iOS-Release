//
//  LikeEditView.swift
//  Keyneez-iOS-Release
//
//  Created by 최효원 on 2023/08/07.
//

import SwiftUI

struct LikeEditView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                Color.gray100
                    .ignoresSafeArea(.all)
                ScrollView {
                    Spacer().frame(height: 86)
                    VStack {
                       
                    }
                }
            
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    struct ExploreSearchTopView: View {
        @Environment(\.dismiss) private var dismiss

        var body: some View {
            VStack(spacing:0) {
                ZStack {
                    Color.navigationColor
                        .edgesIgnoringSafeArea(.all)
                    HStack {
                        
                        Spacer()
                        Button(action: {
                            dismiss()
                        }, label: {
                            Text("취소")
                                .font(.pretendard(.medium, size: 18))
                        })
                        .foregroundColor(.gray900)
                        
                    }
                    .padding([.leading, .trailing], 24)
                }
                Color.gray400
                    .frame(height: 0.7)
            }
        }
    }
    
    struct ExploreSearchGridView: View {
      var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 14), // 가로 간격 설정
        GridItem(.flexible())
      ]
      
      var body: some View {
        LazyVGrid(columns: columns, spacing: 17) {
          ForEach((0...5), id: \.self ) {_ in
            ExploreCardViewCell()
          }
        }
        .padding([.leading, .trailing], 22)
      }
    }
}
