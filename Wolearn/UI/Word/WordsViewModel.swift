//
//  WordsViewModel.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 4/19/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation

final class WordsViewModel: NetworkViewModel {

    enum WordStatus {
        case known
        case unknown
    }

    private let coordinator: AppCoordinator
    private let words: [Word]
    private var currentIndex = 0
    @Published var currentWord: Word {
        didSet {
            objectWillChange.send()
        }
    }

    init(coordinator: AppCoordinator, words: [Word]) {
        assert(!words.isEmpty)
        self.coordinator = coordinator
        self.words = words
        self.currentWord = words[currentIndex]
    }

    func setWordStatus(_ status: WordStatus) {
        currentIndex += 1
        if currentIndex < words.count {
            currentWord = words[currentIndex]
        } else {
            coordinator.finishLearning()
        }
    }
}
