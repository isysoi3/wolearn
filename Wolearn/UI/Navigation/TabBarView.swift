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
        UINavigationBar.appearance().backgroundColor = UIColor.purple
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }

    var body: some View {
        TabView {
            NavigationView {
                ProfileView()
                    .navigationBarItems(leading: Text("Wolearn").font(.title).foregroundColor(.white))
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarHidden(false)
            }.tabItem {
                Image(uiImage: R.image.profile_icon()!)
//                Text("Profile")
            }
            NavigationView {
                CategoriesView(viewModel: CategoriesViewModel(coordinator: coordinator))
                    .navigationBarItems(leading: Text("Wolearn").font(.title).foregroundColor(.white))
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarHidden(false)
            }.tabItem {
                Image(uiImage: R.image.learning_icon()!)
//                Text("Learning")
            }
            NavigationView {
                SettingsView(viewModel: SettingsViewModel(coordinator: coordinator))
                    .navigationBarItems(leading: Text("Wolearn").font(.title).foregroundColor(.white))
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarHidden(false)
            }.tabItem {
                Image(uiImage: R.image.settings_icon()!)
//                Text("Settings")
            }
        }
    }

}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(coordinator: AppCoordinator())
    }
}
