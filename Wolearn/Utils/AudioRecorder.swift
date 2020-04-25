//
//  AudioRecorder.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/28/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation
import AVFoundation
import Combine

struct Recording {
    let fileURL: URL
    let createdAt: Date
}

class AudioRecorder: ObservableObject {

    let objectWillChange = PassthroughSubject<AudioRecorder, Never>()

    var audioRecorder: AVAudioRecorder!
    var audioFilename: URL?

    var recording = false {
        didSet {
            objectWillChange.send(self)
        }
    }

    func startRecording() {
        let recordingSession = AVAudioSession.sharedInstance()

        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            print("Failed to set up recording session")
        }

        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let date = Date().toString(with: "dd-MM-YY_'at'_HH:mm:ss")
        let audioFilename = documentPath.appendingPathComponent("\(date).m4a")

        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.record()

            recording = true
        } catch(let error) {
            print(error.localizedDescription)
            print("Could not start recording")
        }
        self.audioFilename = audioFilename
    }

    func stopRecording() -> URL? {
        audioRecorder.stop()
        recording = false
        return audioFilename
    }

}
