//
//  HistoryRow.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/26/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation
import SwiftUI

struct HistoryRow: View {

    let item: HistoryItem

    var body: some View {
        HStack {
            VStack {
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 10, height: 10)
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 1)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(item.word).foregroundColor(Color.black)
                Text(item.category).foregroundColor(Color.black)
                Text(item.date.toString(with: "MMMM d, yyyy - h:mm a")).foregroundColor(Color.yellow)
            }
        }
    }
}
