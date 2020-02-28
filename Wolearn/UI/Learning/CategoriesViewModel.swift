//
//  CategoriesViewModel.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/26/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation
import SwiftUI

final class CategoriesViewModel: NetworkViewModel {

    @Published var searchText = String()
    @Published var categories: [Category] = []

    @ObservedObject var recorder: AudioRecorder = AudioRecorder()
    @ObservedObject var player: AudioPlayer = AudioPlayer()

    private let coordinator: AppCoordinator

    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        super.init()

        loadInfo()
    }

    private func loadInfo() {
        let token = AppState.shared.token!
        let request = GetCategoriesRequest(token: token)
        doRequest(request) { [weak self] categories in
            self?.categories = categories
        }
    }

    func startLearning() {
        let token = AppState.shared.token!
        let request = LearningRequest(token: token)
        doRequest(request) { [weak self] words in
            self?.coordinator.startLearning(words: words)
        }
    }

    func startRepeat() {
//        let token = AppState.shared.token!
//        let request = LearningRequest(token: token)
//        doRequest(request) { [weak self] words in
//            self?.coordinator.startLearning(words: words)
//        }
        if recorder.recording {
            let url = recorder.stopRecording()
            print(url)
            if url != nil {
                player.startPlayback(audio: url!)
            }

        } else {
            recorder.startRecording()
        }
    }

}
