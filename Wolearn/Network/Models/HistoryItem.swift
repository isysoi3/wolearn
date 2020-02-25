//
//  HistoryItem.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

struct HistoryItem: Identifiable, Codable {

    var id: String {
        word
    }
    let word: String
    let category: String
    let date: Date

}
