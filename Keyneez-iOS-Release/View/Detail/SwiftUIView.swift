//
//  SwiftUIView.swift
//  Keyneez-iOS-Release
//
//  Created by 박의서 on 2023/07/09.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hi!")
                NavigationLink {
                    DetailView()
                } label: {
                    Text("GO!")
                }
                
            }
        }.accentColor(.black)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
