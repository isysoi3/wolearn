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

    enum WordLearningState {
        case hidden
        case quiz
        case examples
    }

    private let audioService = AudioService()

    private let coordinator: AppCoordinator
    private let words: [Word]
    private var currentIndex = 0

    @Published var score: Int? {
        didSet {
            objectWillChange.send()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.25) { [weak self] in
                self?.score = .none
            }
        }
    }
    @Published var currentWord: Word {
        willSet {
            learningState = .hidden
            score = .none
        }
        didSet {
            objectWillChange.send()
        }
    }
    @Published var learningState: WordLearningState = .hidden {
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
//        let token = AppState.shared.token!
//        let word = MemorizableWord(id: currentWord.id, isMemorized: status == .known)
//        let request = MemorizeWordRequest(token: token, word: word)
//        doRequest(request) { [weak self] _ in
//            self?.updateState()
//        }
        updateState()
    }

    private func updateState() {
        currentIndex += 1
        if currentIndex < words.count {
            currentWord = words[currentIndex]
        } else {
            coordinator.finishLearning()
        }
    }

    func showExamples() {
        learningState = .examples
    }

    func showQuiz() {
        learningState = .quiz
    }

    private lazy var recorder: AudioRecorder = AudioRecorder()
    private lazy var player: AudioPlayer = AudioPlayer()

    func recordWord() {
        if !recorder.recording {
            recorder.startRecording()
        } else {
            let url = recorder.stopRecording()
            print(url)
            guard
                let urlValue = url,
                let data = try? Data(contentsOf: urlValue, options: [.mappedIfSafe]) else {
                    return
            }
            player.startPlayback(audio: urlValue)
            let request = GetAudioScoreRequest(
                token: Token(value: "dsds"),
                data: GetAudioScoreData(wordId: currentWord.id, audio: data)
            )
            doRequest(service: audioService, request) { [weak self] result in
                self?.score = result.score
            }
        }
    }

}