//
//  HistoryRequest.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

struct HistoryRequest: RequestType {

    typealias Response = [HistoryItem]

    let token: Token
    let range: (offset: Int, num: Int)

    var identifier: String {
        path.uppercased()
    }
    let path: String = "user/history"
    var queryItems: [URLQueryItem]? {
        [.init(name: "offset", value: String(range.offset)),
         .init(name: "num", value: String(range.num))]
    }
    let method: HTTPMethod = .get
    let body: Data? = .none
    var header: [String : String]? {
        ["Authorization" : "Bearer \(token.value)"]
    }

}
