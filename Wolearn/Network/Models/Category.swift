//
//  Category.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

struct Category: Identifiable, Hashable, Codable {
    let id: Int
    let name: String
    let imageURL: String
    var isSelected: Bool
}
