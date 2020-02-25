//
//  SettingsViewModel.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/26/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

final class SettingsViewModel: NetworkViewModel {

    func removeAccount() {
        let token = AppState.shared.token
        let request = DeleteUserRequest(token: token)
        doRequest(request) { [weak self] _ in
            print("success")
        }
    }

    func resetStatistics() {
        let token = AppState.shared.token
        let request = ResetStatisticsRequest(token: token)
        doRequest(request) { [weak self] _ in
            print("success")
        }
    }

    func logout() {

    }

}
