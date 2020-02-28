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
    var cache: ImageCache

    var body: some View {
        Button(action: { self.content.isSelected.toggle() }) {
            HStack {
                Group {
                    AsyncImage(
                        url: URL(string:  "http://wolearn-api.herokuapp.com")!.appendingPathComponent(content.imageURL),
                        cache: cache,
                        placeholder: Circle().fill(Color.purple),
                        configuration: { $0.resizable()})
                        .frame(width: 45, height: 45)
                }.cornerRadius(45/2).clipped()
                Text(content.name)
                Spacer()
                Image(systemName: content.isSelected ? "checkmark.circle.fill" : "circle")
            }
        }
    }

}
