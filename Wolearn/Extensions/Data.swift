//
//  Data.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/27/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

extension Data {

    func to<T>(type: T.Type) -> T? where T: Decodable {
        try? JSONDecoder().decode(type, from: self)
    }

}
