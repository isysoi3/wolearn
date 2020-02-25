//
//  RegistrationRequest.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

struct RegistrationRequestInfo: Encodable {
    let login: String
    let password: String
    let name: String
    let surname: String
}

struct RegistrationRequest: RequestType {

    typealias Response = Empty

    let info: RegistrationRequestInfo

    var identifier: String {
        path.uppercased()
    }
    let path: String = "register"
    let queryItems: [URLQueryItem]? = .none
    let method: HTTPMethod = .post
    var body: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(info)
    }
    let header: [String : String]? = .none

}
