//
//  CategoriesView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/24/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import SwiftUI

struct CategoriesView: View {

    @ObservedObject var viewModel: CategoriesViewModel

    var body: some View {
        LoadingView(isShowing: $viewModel.isLoading, content: buildContent)
    }
    
    private func buildContent() -> some View {
        VStack(alignment: .center) {
            //            TextField("Search", text: $viewModel.searchText)
            //                .textFieldStyle(RoundedBorderTextFieldStyle())
            List(viewModel.categories, rowContent: CategoryRow.init)
                .onAppear { UITableView.appearance().separatorStyle = .none }
                .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
            ViewStyles.primaryButton(text: "Start learning new words", action: viewModel.startLearning)
                .offset(y: 10)
                .padding(.bottom, 10)
            ViewStyles.primaryButton(text: "Repeat words", action: viewModel.startLearning)
                .offset(y: 10)
                .padding(.bottom, 10)
        }.padding([.horizontal, .bottom], 16)
            .alert(isPresented: $viewModel.isError, content: {
                Alert(title: Text("Error"),
                      message: Text(viewModel.errorMessage ?? ""),
                      dismissButton: .default(Text("OK"))
                )
            }).background(Color.white)
            
    }

}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(viewModel: CategoriesViewModel(coordinator: AppCoordinator()))
    }
}
