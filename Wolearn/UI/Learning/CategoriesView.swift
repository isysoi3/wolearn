//
//  CategoriesView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/24/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import SwiftUI

struct Category: Identifiable, Hashable {
    let id: Int
    let name: String
    var isSelected: Bool
}

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

struct CategoriesView: View {

    @State private var searchText = String()

    @State var categories: [Category] = [
        Category(id: 1, name: "Test1", isSelected: true),
        Category(id: 2, name: "Test2", isSelected: false),
        Category(id: 1, name: "Test1", isSelected: true),
        Category(id: 2, name: "Test2", isSelected: false),
        Category(id: 1, name: "Test1", isSelected: true),
        Category(id: 2, name: "Test2", isSelected: false),
        Category(id: 3, name: "Test3", isSelected: true)
    ]

    var body: some View {
        VStack(alignment: HorizontalAlignment.center, spacing: 16) {
            TextField("Search", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
                .offset(y: 16)
            List(categories) {  CategoryRow(content: $0) }
                .onAppear { UITableView.appearance().separatorStyle = .none }
                .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
            Button(action: { }) {
                Text("Start learning new words")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 36)
                    .background(Color.yellow)
                    .foregroundColor(Color.black)
            }.padding(.horizontal, 16.0)
            .offset(y: -16)
            Button(action: { }) {
                Text("Repeat words")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 36)
                    .background(Color.yellow)
                    .foregroundColor(Color.black)
            }.padding(.horizontal, 16.0)
                .offset(y: -16)
        }
    }

}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        var view = CategoriesView()
        let item1 = Category(id: 1, name: "Test1", isSelected: true)
        let item2 = Category(id: 2, name: "Test2", isSelected: false)
        let item3 = Category(id: 3, name: "Test3", isSelected: true)
        view.categories = [item1, item2, item3]
        return view
    }
}
