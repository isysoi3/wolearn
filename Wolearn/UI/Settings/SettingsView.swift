//
//  SettingsView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/24/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            Button(action: { }) {
                Text("Delete account")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 36)
                    .background(Color.yellow)
                    .foregroundColor(Color.black)
            }.padding(.horizontal, 16.0)
            Button(action: { }) {
                Text("Reset statistics")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 36)
                    .background(Color.yellow)
                    .foregroundColor(Color.black)
            }.padding(.horizontal, 16.0)
            Button(action: { }) {
                Text("Logout")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 36)
                    .background(Color.yellow)
                    .foregroundColor(Color.black)
            }.padding(.horizontal, 16.0)
        }.padding(.bottom, 48)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
