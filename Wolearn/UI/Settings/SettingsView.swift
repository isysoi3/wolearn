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
        LoadingView(isShowing: $viewModel.isLoading, content: buildContent)
    }

    private func buildContent() -> some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            ViewStyles.primaryButton(text: "Delete account", action: viewModel.removeAccount)
            ViewStyles.primaryButton(text: "Reset statistics", action: viewModel.resetStatistics)
            ViewStyles.primaryButton(text: "Logout", action: viewModel.logout)
        }
        .padding([.bottom, .horizontal], 16)
        .alert(isPresented: $viewModel.isError, content: {
            Alert(title: Text("Error"),
                  message: Text(viewModel.errorMessage ?? ""),
                  dismissButton: .default(Text("OK"))
            )
        })
    }

}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: SettingsViewModel(coordinator: AppCoordinator()))
    }
}
