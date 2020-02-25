//
//  LoginViewModel.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

final class LoginViewModel: NetworkViewModel {

    @Published var userLogin: String = String()
    @Published var userPassword: String = String()

    @Published var showRegistration = false

    func login() {
        let isAllFieldsFilled = !userLogin.isEmpty && !userPassword.isEmpty
        if !isAllFieldsFilled {
            showError("Fill all fields")
            return
        }
        let request = LoginRequest(info: LoginRequestInfo(login: userLogin, password: userPassword))
        doRequest(request) { token in
            print(token)
        }
    }

    func register() {
        showRegistration = true
    }

}
