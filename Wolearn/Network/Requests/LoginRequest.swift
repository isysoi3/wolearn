//
//  LoginRequest.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

struct Token: Decodable {
    enum CodingKeys: String, CodingKey {
        case value = "token"
    }

    let value: String
}

struct LoginRequestInfo: Encodable {
    let login: String
    let password: String
}

struct LoginRequest: RequestType {

    typealias Response = Token

    let info: LoginRequestInfo

    var identifier: String {
        path.uppercased()
    }
    let path: String = "login"
    let queryItems: [URLQueryItem]? = .none
    let method: HTTPMethod = .post
    var body: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(info)
    }
    let header: [String : String]? = .none

}
