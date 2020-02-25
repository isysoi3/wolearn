//
//  Word.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/25/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

struct Quiz: Decodable {
    let indexOfRight: Int
    let options: [String]
}

struct Word: Decodable {
    let id: Int
    let name: String
    let examples: [String]
    let pos: String
    let transcription: String
    let quiz: Quiz
}
