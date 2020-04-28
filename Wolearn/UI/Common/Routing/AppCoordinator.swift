//
//  AppCoordinator.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/26/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//
//
import Foundation
import Combine
import SwiftUI

class AppCoordinator: ObservableObject {

    enum AppStateEnum {
        case login
        case registration
        case authorized
        case learning([Word])
    }

    let objectWillChange = PassthroughSubject<AppCoordinator, Never>()

    var state: AppStateEnum {
        didSet {
            withAnimation {
                objectWillChange.send(self)
            }
        }
    }

    init() {
        state = AppState.shared.isUserAuthorized ? .authorized : .login
    }

    func goToRegistration() {
        state = .registration
    }

    func goToLogin() {
        state = .login
    }

    func userHasBeenAuthorized(with token: Token) {
        AppState.shared.token = token
        state = .authorized
    }

    func logout() {
        AppState.shared.token = .none
        goToLogin()
    }

    func startLearning(words: [Word]) {
        state = .learning(words)
        print(words)
    }

    func finishLearning() {
        state = .authorized
    }

}
