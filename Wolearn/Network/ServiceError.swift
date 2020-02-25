//
//  ServiceError.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

struct ServerError: Decodable {
    let reason: String
}

enum ServiceError: Error {
    case network
    case parsing
    case server(ServerError)

    var description: String {
        switch self {
        case let .server(error):
            return error.reason
        case .parsing:
            return "Parsing failed"
        case .network:
            return "Network error"
        }
    }

}
