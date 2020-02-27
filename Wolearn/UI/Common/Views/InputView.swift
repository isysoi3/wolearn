//
//  InputView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/27/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation
import SwiftUI

struct InputView: View {
   
    private let title: String
    private let text: Binding<String>
    @State private var isSecured: Bool
    @State private var isTextEmpty: Bool
    
    init(title: String, text: Binding<String>, isSecured: Bool) {
        self.title = title
        self.text = text
        self._isSecured = State(initialValue: isSecured)
        self._isTextEmpty = State(initialValue: text.wrappedValue.isEmpty)
    }
    
    private var textProxy: Binding<String> {
        return Binding<String>(
            get: {
                self.text.wrappedValue
            },
            set: {
                self.isTextEmpty = $0.isEmpty
                self.text.wrappedValue = $0
            }
        )
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if !isTextEmpty {
                Text(title).foregroundColor(.yellow)
            } else {
                Text(title).foregroundColor(.yellow).hidden()
            }
            ZStack(alignment: .leading) {
                if isTextEmpty { Text(title).foregroundColor(.yellow) }
                if isSecured {
                    SecureField("", text: textProxy).accentColor(.yellow)
                } else {
                    TextField("", text: textProxy).accentColor(.yellow)
                }
            }
            
            HorizontalLine(color: .yellow, height: 2)
        }.padding(.bottom, 2)
    }
    
}

