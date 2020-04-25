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
            containedView()
        }
    }

    func containedView() -> AnyView {
        switch coordinator.state {
        case .login:
            return  AnyView(
                LoginView(viewModel: LoginViewModel(coordinator: coordinator)).transition(.opacity)
            )
        case .registration:
            return AnyView(
                RegistrationView(viewModel: RegistrationViewModel(coordinator: coordinator)).transition(.move(edge: .trailing))
            )
        case let .learning(words):
            return AnyView(
                WordsView(viewModel: WordsViewModel(coordinator: coordinator, words: words))
                    .transition(.move(edge: .bottom))
            )
        default:
            return AnyView(TabBarView(coordinator: coordinator).transition(.opacity))
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
