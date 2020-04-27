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

    private let audioService = AudioService()

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

    private lazy var recorder: AudioRecorder = AudioRecorder()
    private lazy var player: AudioPlayer = AudioPlayer()

    func tmp() {
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
                print(result)
            }
        }
    }

}
