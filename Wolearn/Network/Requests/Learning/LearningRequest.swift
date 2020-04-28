//
//  LearningRequest.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

struct LearningRequest: RequestType {

    enum LearningType {
        case new
        case `repeat`

        var identifier: String {
            switch self {
            case .new:
                return "learn"
            case .repeat:
                return "repeat"
            }
        }
    }

    typealias Response = [Word]

    let token: Token

    var identifier: String {
        path.uppercased()
    }
    let path: String
    let queryItems: [URLQueryItem]? = .none
    let method: HTTPMethod = .get
    let body: Data? = .none
    var header: [String : String]? {
        ["Authorization" : "Bearer \(token.value)"]
    }

    init(type: LearningType, token: Token) {
        path = type.identifier
        self.token = token
    }

}
