//
//  RegistrationView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/24/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import SwiftUI

struct RegistrationView: View {

    @State private var login: String = String()
    @State private var password: String = String()
    @State private var name: String = String()
    @State private var surname: String = String()

    var body: some View {
        VStack(alignment: HorizontalAlignment.center, spacing: 20) {
            TextField("Enter login", text: $login)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
            SecureField("Enter password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
            TextField("Enter name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
            TextField("Enter surname", text: $surname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
            Button(action: { }) {
                Text("Register")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 36)
                    .background(Color.yellow)
                    .foregroundColor(Color.black)
            }.padding(.horizontal, 16.0)
                .offset(y: 20)
        }.background(Image(uiImage: R.image.login_background()!))
    }

}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
