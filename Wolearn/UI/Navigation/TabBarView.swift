//
//  TabBarView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/24/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import SwiftUI

struct TabBarView: View {

    private let coordinator: AppCoordinator

    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .blue
        UITabBar.appearance().layer.borderWidth = 0.5
        UITabBar.appearance().layer.borderColor = UIColor.black.cgColor
    }

    var body: some View {
        TabView {
            HeaderView(title: "Wolearn", content: ProfileView())
                .tabItem {
                    Image(uiImage: R.image.profile_icon()!)
                    //                Text("Profile")
            }
            HeaderView(title: "Wolearn", content: CategoriesView(viewModel: CategoriesViewModel(coordinator: coordinator)))
                .tabItem {
                    Image(uiImage: R.image.learning_icon()!)
                    //                Text("Learning")
            }
            HeaderView(title: "Wolearn", content: SettingsView(viewModel: SettingsViewModel(coordinator: coordinator)))
                .tabItem {
                    Image(uiImage: R.image.settings_icon()!)
                    //                Text("Settings")
            }
        }.edgesIgnoringSafeArea(.top)
    }

}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(coordinator: AppCoordinator())
    }
}
