//
//  SwiftUISecondView.swift
//  PruebaStoryBoard
//
//  Created by David Eduardo Batista on 01/11/24.
//



import SwiftUI

struct SwiftUISecondView: View {
    // true: return Login
    // false: return CustomView -> MenuViewController
    var isRootReturnView: Bool = true
    var body: some View {
        VStack {
            Text("Second View SwiftUI")
                .font(.title)
                .padding()
            Button(action: {
                if isRootReturnView {
                    NavigationUtil.popToViewController(ofType: LoginViewController.self, animated: true)
                } else {
                    NavigationUtil.popToViewController(ofType: MenuViewController.self, animated: true)
                }
            }, label: {
                Text(isRootReturnView ? "Regresar a Login": "Regresar a Menu")
            })
        }
    }
}

#Preview {
    SwiftUISecondView()
}
