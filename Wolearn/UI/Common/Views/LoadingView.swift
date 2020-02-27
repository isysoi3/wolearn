//
//  LoadingView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/26/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
struct LoadingView<Content>: View where Content: View {

    @Binding var isShowing: Bool
    var content: () -> Content

    var body: some View {
        ZStack(alignment: .center) {
            if isShowing {
                ZStack {
                    content().disabled(true).background(Color.gray)
                    Rectangle().fill(Color.black).opacity(0.4)
                }
                VStack {
                    Text("Loading...").padding(.horizontal, 30).padding(.top, 20)
                    ActivityIndicator(isAnimating: .constant(true), style: .whiteLarge).padding(.bottom, 20)
                }
                .background(Color.black)
                .foregroundColor(Color.white)
                .opacity(0.7)
                .cornerRadius(10)
            } else {
                content()
            }
        }
    }

}
