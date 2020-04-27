//
//  RequestType.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case post
    case get
    case delete

    var value: String {
        return self.rawValue.uppercased()
    }
}

protocol RequestType {
    associatedtype Response: Decodable

    var url: URL { get }
    var identifier: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem]? { get }
    var body: Data? { get }
    var header: [String : String]? { get }

}

extension RequestType {

    var url: URL {
        URL(string: "http://wolearn-api.herokuapp.com/api/v1/")!
    }

}
