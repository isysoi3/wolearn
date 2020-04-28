//
//  AudioService.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 4/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation
import Combine

final class AudioService: Service {

    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func send<Request>(
        _ request: Request,
        _ decoder: JSONDecoder = JSONDecoder()
    ) -> AnyPublisher<Request.Response, ServiceError> where Request: RequestType {
        let boundary = "--210454555871015500921035"
        let pathURL = request.url.appendingPathComponent(request.path)
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = request.method.value
        urlRequest.httpBody = request.body
        urlRequest.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        log.debug("\(request.identifier)Request: \(urlRequest)\n")

        return session
            .dataTaskPublisher(for: urlRequest)
            .mapError { _ in ServiceError.network }
            .tryMap { result in
                let data = result.data
                log.debug("\(request.identifier)Response: \(String(data: data, encoding: .utf8)!)")
                if let error = try? decoder.decode(ServerError.self, from: data) {
                    throw ServiceError.server(error)
                }
                guard let response = try? decoder.decode(Request.Response.self, from: data) else {
                    if data.isEmpty && Request.Response.self == Empty.self {
                        return Empty() as! Request.Response
                    } else {
                        throw ServiceError.parsing
                    }
                }
                return response
            }
            .mapError { error in error as! ServiceError}
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
