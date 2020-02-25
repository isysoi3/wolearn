//
//  MemorizeWordRequest.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

struct MemorizeWordRequest: RequestType {

    typealias Response = Empty

    let token: Token
    let word: MemorizableWord

    var identifier: String {
        path.uppercased()
    }
    let path: String = "word"
    let queryItems: [URLQueryItem]? = .none
    let method: HTTPMethod = .post
    var body: Data? {
        try! JSONEncoder().encode(word)
    }
    var header: [String : String]? {
        ["Authorization" : "Bearer \(token.value)"]
    }

}
