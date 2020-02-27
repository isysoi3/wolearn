//
//  Encodable.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/27/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

extension Encodable {

    var data: Data? {
        try? JSONEncoder().encode(self)
    }

}
