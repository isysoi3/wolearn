//
//  HeaderView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/27/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation
import SwiftUI

struct HeaderView<Content>: View where Content: View {

    let title: String
    var content: Content

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ZStack {
                Rectangle().fill(Color.purple)
                Text(title)
                    .font(.title)
                    .foregroundColor(.white)
                    .position(x: 80, y: UIApplication.shared.statusBarFrame.height + 30)
            }.frame(width: UIScreen.main.bounds.width, height: UIApplication.shared.statusBarFrame.height + 60)
            content
        }.edgesIgnoringSafeArea(.top)
    }
}
