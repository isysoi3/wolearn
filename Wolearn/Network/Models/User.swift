//
//  User.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

struct Statistics: Decodable {
    let today: Int
    let total: Int
    let categories: Int
}

struct UserInfo: Decodable {
    let id: Int
    let surname: String
    let login: String
    let name: String
}

struct User: Decodable {
    let statistics: Statistics
    let info: UserInfo
}
