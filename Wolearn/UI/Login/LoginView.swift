//
//  LoginView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/18/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import SwiftUI

struct LoginView: View {

    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        LoadingView(isShowing: $viewModel.isLoading, content: buildContent)
    }

    private func buildContent() -> some View {
        ZStack {
            ActivityIndicator(isAnimating: $viewModel.isLoading, style: .large)
            Image(uiImage: R.image.login_background()!)
            VStack(alignment: .center, spacing: 10) {
                InputView(title: "Login", text: $viewModel.userLogin, isSecured: false)
                InputView(title: "Password", text: $viewModel.userPassword, isSecured: true)
                ViewStyles.primaryButton(text: "Login", action: viewModel.login)
                    .offset(y: 30)
                    .padding(.bottom, 30)
                ViewStyles.baseButton(text: "Register", action: viewModel.register)
            }.padding(.horizontal, 32)
        }
        .alert(isPresented: $viewModel.isError, content: {
            Alert(title: Text("Error"),
                  message: Text(viewModel.errorMessage ?? ""),
                  dismissButton: .default(Text("OK"))
            )
        })
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(coordinator: AppCoordinator()))
    }
}
