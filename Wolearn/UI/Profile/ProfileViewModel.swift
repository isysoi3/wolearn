//
//  ProfileViewModel.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/26/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

final class ProfileViewModel: NetworkViewModel {

    @Published var user: User?
    @Published var history: [HistoryItem] = []

    override init() {
        super.init()
        
        loadInfo()
    }
    
    func loadInfo() {
        getUserInfo()
        getHistory()
    }

    private func getUserInfo() {
        let token = AppState.shared.token!
        let request = GetUserRequest(token: token)
        doRequest(request) { [weak self] user in
            self?.user = user
        }
    }

    private func getHistory() {
        let token = AppState.shared.token!
        let request = HistoryRequest(token: token, range: (offset: 0, num: 20))
        doRequest(request) { [weak self] history in
            self?.history = history
        }
    }

}
