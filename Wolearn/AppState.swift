//
//  AppState.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/26/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation
import KeychainSwift

class AppState {

    private let userTokenKey = "user_token_key"
    private let keychain = KeychainSwift()

    static let shared = AppState()
    var token: Token? {
        didSet {
            if let token = token,
                let data = token.data {
                 keychain.set(data, forKey: userTokenKey)
            } else {
                keychain.delete(userTokenKey)
            }
        }
    }
    var isUserAuthorized: Bool {
        token != nil
    }
    private init() {
        token = keychain.getData(userTokenKey)?.to(type: Token.self)
    }

}
