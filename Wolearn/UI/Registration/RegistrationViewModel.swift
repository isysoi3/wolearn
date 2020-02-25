//
//  RegistrationViewModel.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

final class RegistrationViewModel: NetworkViewModel {

    @Published var login: String = String()
    @Published var password: String = String()
    @Published var name: String = String()
    @Published var surname: String = String()

    func register() {
        let isAllFieldsFilled = !login.isEmpty
            && !password.isEmpty
            && !name.isEmpty
            && !surname.isEmpty
        if !isAllFieldsFilled {
            showError("Fill all fields")
            return
        }
        let info = RegistrationRequestInfo(login: login, password: password, name: name, surname: surname)
        let request = RegistrationRequest(info: info)
        doRequest(request) { _ in
            print("top")
        }
    }

}
