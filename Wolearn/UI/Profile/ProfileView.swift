//
//  ProfileView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/24/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import SwiftUI

struct ProfileView: View {

    @ObservedObject var viewModel = ProfileViewModel()

    init() {
        UITableView.appearance().separatorColor = .clear
    }

    var body: some View {
        LoadingView(isShowing: $viewModel.isLoading, content: buildContent)
    }

    private func buildContent() -> some View {
        VStack(alignment: .leading) {
            ProfileInfoPreview(userInfo: $viewModel.user)
                .background(Color.white)
                .padding(.horizontal, 16)
                .shadow(radius: 2)
            Text("History:").padding(.leading, 16).padding(.top, 16)
            List(viewModel.history, rowContent: HistoryRow.init)
                .onAppear { UITableView.appearance().separatorStyle = .none }
                .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
        }
        .alert(isPresented: $viewModel.isError, content: {
            Alert(title: Text("Error"),
                  message: Text(viewModel.errorMessage ?? ""),
                  dismissButton: .default(Text("OK"))
            )
        }).background(Color.white)
            .padding(.top, 16)
    }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
