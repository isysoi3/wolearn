//
//  NetworkViewModel.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/26/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation
import Combine

class NetworkViewModel: ObservableObject {

    private(set) var errorMessage: String?
    @Published var isError = false
    @Published var isLoading = false

    private var disposables = Set<AnyCancellable>()

    private let service = WolearnService()

    init() {
    }

    deinit {
        disposables.forEach { $0.cancel() }
    }

    func doRequest<Request>(_ request: Request, completionBlock: @escaping (Request.Response) -> Void)
        where Request: RequestType {
        isLoading = true
        service.send(request)
            .sink(receiveCompletion: errorHandler,
                  receiveValue: { [weak self] value in
                    self?.isLoading = false
                    completionBlock(value)
                }
        ).store(in: &disposables)
    }

    func errorHandler(value: Subscribers.Completion<ServiceError>) {
        isLoading = false
        switch value {
        case let .failure(error):
            errorMessage = error.description
            isError = true
        case .finished:
            break
        }
    }

    func showError(_ message: String) {
        errorMessage = message
        isError = true
    }

}
