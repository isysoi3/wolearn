//
//  QuizView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 4/28/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation
import SwiftUI

struct QuizView: View {

    struct QuizRow: Hashable {

        struct Item: Hashable {
            let id: Int
            let value: String
        }

        let first: Item
        let second: Item

        static func == (lhs: QuizRow, rhs: QuizRow) -> Bool {
            lhs.first.id == rhs.first.id
                && lhs.first.value == rhs.first.value
                && lhs.second.id == rhs.second.id
                && lhs.second.value == rhs.second.value
        }
    }

    @State private var selectedIndex: Int?

    let quiz: Quiz
    private let quizRows: [QuizRow]

    init(quiz: Quiz) {
        self.quiz = quiz
        self.quizRows = quiz.options.chunked(by: 2).enumerated().map { (index, items) in
            QuizRow(
                first: QuizRow.Item(id: 2 * index, value: items.first!),
                second: QuizRow.Item(id: 2 * index + 1, value: items.last!)
            )
        }
    }

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ForEach(quizRows, id: \.self) { option in
                HStack(alignment: .center, spacing: 0) {
                    Text(option.first.value)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .border(self.colorFor(index: option.first.id), width: 1)
                        .onTapGesture {
                            self.selectedIndex = option.first.id
                        }
                    Text(option.second.value)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .border(self.colorFor(index: option.second.id), width: 1)
                        .onTapGesture {
                            self.selectedIndex = option.second.id
                        }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }

    private func colorFor(index: Int) -> Color {
        if selectedIndex == index {
            return quiz.indexOfRight == index ? Color.green : Color.red
        } else {
            return Color.black
        }
    }

}

extension Array {
    func chunked(by chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}
