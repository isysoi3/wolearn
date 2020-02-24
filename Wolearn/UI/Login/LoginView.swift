//
//  LoginView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/18/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import SwiftUI

struct LoginView: View {

    @State private var login: String = String()
    @State private var password: String = String()

    var body: some View {
        VStack(alignment: HorizontalAlignment.center, spacing: 20) {
            TextField("Login", text: $login)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
            Button(action: { }) {
                Text("Login")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 36)
                    .background(Color.yellow)
                    .foregroundColor(Color.black)
            }.padding(.horizontal, 16.0)
                .offset(y: 20)
            Button(action: { }) {
                Text("Register")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 36)
                    .background(Color.clear)
                    .foregroundColor(Color.yellow)
            }.padding(.horizontal, 16.0)
                .offset(y: 20)
        }.background(Image(uiImage: R.image.login_background()!))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
