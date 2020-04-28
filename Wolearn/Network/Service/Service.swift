//
//  Service.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 4/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation
import Combine

protocol Service {
    func send<Request>(_ request: Request, _ decoder: JSONDecoder) -> AnyPublisher<Request.Response, ServiceError>
        where Request: RequestType
}
