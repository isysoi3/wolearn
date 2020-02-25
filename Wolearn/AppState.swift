//
//  AppState.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/26/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

class AppState {

    static let shared = AppState()
    var token: Token = Token(value: "Q/Un5CwpBT68mdAO8kfX2A==")
    private init() { }

}
