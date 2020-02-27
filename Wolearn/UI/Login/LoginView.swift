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
            .alert(isPresented: $viewModel.isError, content: {
                Alert(title: Text("Error"),
                      message: Text(viewModel.errorMessage ?? ""),
                      dismissButton: .default(Text("OK"))
                )
            })
    }

    private func buildContent() -> some View {
        VStack(alignment: HorizontalAlignment.center, spacing: 20) {
            TextField("Login", text: $viewModel.userLogin)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
            SecureField("Password", text: $viewModel.userPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
            Button(action: viewModel.login) {
                Text("Login")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 36)
                    .background(Color.yellow)
                    .foregroundColor(Color.black)
            }.padding(.horizontal, 16.0)
                .offset(y: 20)
            Button(action: viewModel.register) {
                Text("Register")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 36)
                    .background(Color.clear)
                    .foregroundColor(Color.yellow)
            }.padding(.horizontal, 16.0)
                .offset(y: 20)
        }
        .background(Image(uiImage: R.image.login_background()!))
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        LoginView(coordinator: AppCoordinator())
        EmptyView()
    }
}
