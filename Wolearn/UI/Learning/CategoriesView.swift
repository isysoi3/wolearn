//
//  CategoriesView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/24/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import SwiftUI

struct CategoriesView: View {

    @ObservedObject var viewModel = CategoriesViewModel()

    var body: some View {
        VStack(alignment: HorizontalAlignment.center, spacing: 16) {
            TextField("Search", text: $viewModel.searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
                .offset(y: 16)
            List(viewModel.categories) {  CategoryRow(content: $0) }
                .onAppear { UITableView.appearance().separatorStyle = .none }
                .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
            Button(action: viewModel.startLearning) {
                Text("Start learning new words")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 36)
                    .background(Color.yellow)
                    .foregroundColor(Color.black)
            }.padding(.horizontal, 16.0)
            .offset(y: -16)
            Button(action: viewModel.startRepeat) {
                Text("Repeat words")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 36)
                    .background(Color.yellow)
                    .foregroundColor(Color.black)
            }.padding(.horizontal, 16.0)
                .offset(y: -16)
        }.onAppear(perform: { [weak viewModel] in viewModel?.loadInfo() })
    }

}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
