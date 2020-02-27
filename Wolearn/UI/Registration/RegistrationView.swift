//
//  RegistrationView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/24/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import SwiftUI

struct RegistrationView: View {

    @ObservedObject var viewModel: RegistrationViewModel

    var body: some View {
        LoadingView(isShowing: $viewModel.isLoading, content: buildContent)
    }

    private func buildContent() -> some View {
        ZStack {
            Image(uiImage: R.image.login_background()!)
            VStack(alignment: .center, spacing: 10) {
                InputView(title: "Login", text: $viewModel.login, isSecured: false)
                InputView(title: "Password", text: $viewModel.password, isSecured: true)
                InputView(title: "Name", text: $viewModel.name, isSecured: false)
                InputView(title: "Surname", text: $viewModel.surname, isSecured: false)
                ViewStyles.primaryButton(text: "Register", action: viewModel.register)
                    .offset(y: 30)
                    .padding(.bottom, 30)
                ViewStyles.baseButton(text: "Back", action: viewModel.goBack)
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

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(viewModel: RegistrationViewModel(coordinator: AppCoordinator()))
    }
}
