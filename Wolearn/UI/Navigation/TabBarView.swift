//
//  TabBarView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/24/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import SwiftUI

struct TabBarView: View {

    @State private var selected = 0

    init() {
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .blue
        UITabBar.appearance().layer.borderWidth = 0.5
        UITabBar.appearance().layer.borderColor = UIColor.black.cgColor
    }

    var body: some View {
        TabView(selection: $selected) {
            ProfileView()
                .tabItem {
                    Image(uiImage: R.image.profile_icon()!)
                    Text("Profile")
            }.tag(0)
            CategoriesView()
                .tabItem {
                    Image(uiImage: R.image.learning_icon()!)
                    Text("Learning")
            }.tag(1)
            SettingsView()
                .tabItem {
                    Image(uiImage: R.image.settings_icon()!)
                    Text("Settings")
            }.tag(2)
        }
    }

}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
