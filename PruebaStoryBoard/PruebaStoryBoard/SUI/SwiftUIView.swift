//
//  SwiftUIView.swift
//  PruebaStoryBoard
//
//  Created by David Eduardo Batista on 01/11/24.
//

import SwiftUI

struct SwiftUIView: View {
    @State var isSecondViewPresented: Bool = false
    var body: some View {
        VStack {
            Text("View SwiftUI")
                .font(.title)
                .padding()
            Button(action: {
                isSecondViewPresented.toggle()                
            }, label: {
                Text("SecondVeiw")
            })
            .fullScreenCover(isPresented: $isSecondViewPresented, content: {
                SwiftUISecondView()
            })
        }
    }
}

#Preview {
    SwiftUIView()
}
