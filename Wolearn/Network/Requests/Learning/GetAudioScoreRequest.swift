//
//  GetAudioScoreRequest.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 4/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

struct GetAudioScoreRequest: RequestType {

    typealias Response = GetAudioScoreResponse

    let token: Token
    let data: GetAudioScoreData

    var identifier: String {
        path.uppercased()
    }
    var url: URL {
        URL(string: "http://localhost:4567/api/v1")!
    }
    let path: String = "get_score"
    let queryItems: [URLQueryItem]? = .none
    let method: HTTPMethod = .post
    var header: [String : String]? {
        ["Authorization" : "Bearer \(token.value)"]
    }
    var body: Data? {
        let uuid = UUID().uuidString
        let boundary = "--210454555871015500921035"

        var body = ""

        body += "--\(boundary)\r\n"
        body += "Content-Disposition: form-data; name=\"wordId\"\r\n\r\n\(data.wordId)\r\n"

        body += "--\(boundary)\r\n"
        body += "Content-Disposition:form-data; name=\"audio\""
            + "; filename=\"\(uuid)-\(data.wordId).m4a\"\r\n"
            + "Content-Type: \"content-type header\"\r\n\r\n"

        var result = body.data(using: .utf8)
        result?.append( data.audio)
        result?.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        return result
    }

}

struct GetAudioScoreResponse: Decodable {
    let score: Int
}

struct GetAudioScoreData {
    let wordId: Int
    let audio: Data
}
