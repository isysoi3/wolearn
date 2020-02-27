//
//  SettingsView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/24/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import SwiftUI

struct SettingsView: View {

    @ObservedObject var viewModel: SettingsViewModel

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            Button(action: viewModel.removeAccount) {
                Text("Delete account")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 36)
                    .background(Color.yellow)
                    .foregroundColor(Color.black)
            }.padding(.horizontal, 16.0)
            Button(action: viewModel.resetStatistics) {
                Text("Reset statistics")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 36)
                    .background(Color.yellow)
                    .foregroundColor(Color.black)
            }.padding(.horizontal, 16.0)
            Button(action: viewModel.logout) {
                Text("Logout")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 36)
                    .background(Color.yellow)
                    .foregroundColor(Color.black)
            }.padding(.horizontal, 16.0)
        }.padding(.bottom, 16)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
