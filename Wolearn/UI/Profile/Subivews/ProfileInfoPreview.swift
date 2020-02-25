//
//  ProfileInfoPreview.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/24/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import SwiftUI

struct ProfileInfoPreview: View {

    @Binding var userInfo: User?

    var body: some View {
        VStack(alignment: .center, spacing: 60) {
            Image(uiImage: R.image.user_avatar()!).frame(width: 80, height: 80)
            HStack(alignment: .center, spacing: 24) {
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .shadow(radius: 3)
                    VStack(alignment: .center) {
                        Text("Today").foregroundColor(Color.yellow)
                        Divider()
                        Text("\(userInfo?.statistics.today ?? 0) word\(userInfo?.statistics.today ?? 0 > 1 ? "s" : "")")
                            .foregroundColor(Color.yellow)
                    }
                }.frame(width: 96, height: 48)
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .shadow(radius: 3)
                    VStack(alignment: .center) {
                        Text("Total").foregroundColor(Color.yellow)
                        Divider()
                        Text("\(userInfo?.statistics.total ?? 0) word\(userInfo?.statistics.total ?? 0 > 1 ? "s" : "")").foregroundColor(Color.yellow)
                    }
                }.frame(width: 96, height: 48)
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .shadow(radius: 3)
                    VStack(alignment: .center) {
                        Text("Categories").foregroundColor(Color.yellow)
                        Divider()
                        Text("\(userInfo?.statistics.categories ?? 0)").foregroundColor(Color.yellow)
                    }
                }.frame(width: 96, height: 48)
            }
        }
    }
}

struct ProfileInfoPreview_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoPreview(userInfo: .constant(.none))
    }
}
