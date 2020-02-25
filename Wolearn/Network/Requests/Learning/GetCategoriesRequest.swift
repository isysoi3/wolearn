//
//  GetCategoriesRequest.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

struct GetCategoriesRequest: RequestType {

    typealias Response = [Category]

    let token: Token

    var identifier: String {
        path.uppercased()
    }
    let path: String = "categories"
    let queryItems: [URLQueryItem]? = .none
    let method: HTTPMethod = .get
    let body: Data? = .none
    var header: [String : String]? {
        ["Authorization" : "Bearer \(token.value)"]
    }

}
