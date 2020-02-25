//
//  CategoryRow.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/26/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation
import SwiftUI

struct CategoryRow: View {

    @State var content: Category

    var body: some View {
        Button(action: {
            self.content.isSelected.toggle()
        }) {
            HStack {
                Image(uiImage: R.image.learning_icon()!)
                    .frame(width: 45, height: 45)
                Text(content.name)
                Spacer()
                Image(systemName: content.isSelected ? "checkmark.circle.fill" : "circle")
            }
        }
    }

}
