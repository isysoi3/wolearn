//
//  ViewStyles.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/27/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation
import SwiftUI

struct ViewStyles {

    static let buttonHeight: CGFloat = 36

    static func baseButton(text: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(text)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: buttonHeight)
                .background(Color.clear)
                .foregroundColor(Color.yellow)
        }
    }

    static func primaryButton(text: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(text)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: buttonHeight)
                .background(Color.yellow)
                .foregroundColor(Color.black)
                .cornerRadius(20)
        }
    }

    static func secondaryButton(text: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(text)
                .multilineTextAlignment(.center)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: buttonHeight)
                .background(Color.clear)
                .foregroundColor(Color.yellow)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.yellow, lineWidth: 2)
                )
        }
    }

    static func imageButton(image: UIImage, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(uiImage: image)
        }
    }

    static func imageButtonWithText(
        image: UIImage,
        text: String,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            VStack(alignment: .center, spacing: 5) {
                Image(uiImage: image)
                Text(text)
            }
        }
    }

}
