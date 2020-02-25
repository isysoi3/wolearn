//
//  APIService.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation
import Combine

protocol Service {
    func send<Request>(_ request: Request, _ decoder: JSONDecoder) -> AnyPublisher<Request.Response, ServiceError>
        where Request: RequestType
}

final class WolearnService: Service {

    private let baseURL = URL(string: "http://wolearn-api.herokuapp.com/api/v1/")!
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func send<Request>(
        _ request: Request,
        _ decoder: JSONDecoder = JSONDecoder()
    ) -> AnyPublisher<Request.Response, ServiceError> where Request: RequestType {

        let pathURL = baseURL.appendingPathComponent(request.path)
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = request.queryItems
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = request.method.value
        urlRequest.httpBody = request.body
        urlRequest.allHTTPHeaderFields = request.header
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        decoder.dateDecodingStrategy = .formatted(DateFormatter.wolearnServer)

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
