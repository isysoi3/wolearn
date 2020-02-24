//
//  ProfileView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/24/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import SwiftUI

struct HistoryItem: Identifiable {
    let id: Int
    let word: String
    let category: String
    let date: Date
}

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
                Text("June 16th, 2019 - 11:23 PM").foregroundColor(Color.yellow)
            }
        }
    }
}

struct ProfileView: View {

    var history: [HistoryItem] = []

    init() {
        UITableView.appearance().separatorColor = .clear
    }

    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            ProfileInfoPreview().offset(x: 16, y: 10)
            Text("History:").offset(x: 16, y: 20)
            List(history) {
                HistoryRow(item: $0)
            }
            .onAppear { UITableView.appearance().separatorStyle = .none }
            .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
            .offset(y: 20)
        }
    }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        var view = ProfileView()
        let item1 = HistoryItem(id: 1, word: "Test1", category: "Test1", date: Date())
        let item2 = HistoryItem(id: 2, word: "Test2", category: "Test2", date: Date())
        let item3 = HistoryItem(id: 3, word: "Test3", category: "Test3", date: Date())
        view.history = [item1, item2, item3]
        return view
    }
}
