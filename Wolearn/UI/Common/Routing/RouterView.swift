//
//  RouterView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/27/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation
import SwiftUI

struct RouterView: View {

    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        VStack {
            if coordinator.state == .login {
                LoginView(viewModel: LoginViewModel(coordinator: coordinator))
                    .transition(.opacity)
            } else if coordinator.state == .registration {
                RegistrationView(viewModel: RegistrationViewModel(coordinator: coordinator))
                    .transition(.move(edge: .trailing))
            } else {
                TabBarView(coordinator: coordinator)
                    .transition(.opacity)
            }
        }
    }
}

#if DEBUG
struct RouterView_Previews : PreviewProvider {
    static var previews: some View {
        RouterView(coordinator: AppCoordinator())
    }
}
#endif
