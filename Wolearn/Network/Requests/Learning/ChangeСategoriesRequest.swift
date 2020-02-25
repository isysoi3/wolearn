//
//  ChangeСategoriesRequest.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

struct ChangeСategoriesRequest: RequestType {

    typealias Response = Empty

    let categories: [Category]
    let token: Token

    var identifier: String {
        path.uppercased()
    }
    let path: String = "categories"
    let queryItems: [URLQueryItem]? = .none
    let method: HTTPMethod = .post
    var body: Data? {
        let encoder = JSONEncoder()
        return try! encoder.encode(categories)
    }
    var header: [String : String]? {
        ["Authorization" : "Bearer \(token.value)"]
    }

}
