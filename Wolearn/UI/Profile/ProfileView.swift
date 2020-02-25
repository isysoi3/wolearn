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
        VStack(alignment: HorizontalAlignment.leading) {
            ProfileInfoPreview(userInfo: $viewModel.user).offset(x: 16, y: 10)
            Text("History:").offset(x: 16, y: 20)
            List(viewModel.history) {
                HistoryRow(item: $0)
            }
            .onAppear { UITableView.appearance().separatorStyle = .none }
            .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
            .offset(y: 20)
        }.onAppear(perform: { [weak viewModel] in viewModel?.loadInfo() })
    }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
