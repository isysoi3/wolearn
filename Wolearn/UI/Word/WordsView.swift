//
//  WordsView.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 4/19/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import SwiftUI

struct WordsView: View {

    @ObservedObject var viewModel: WordsViewModel

    var body: some View {
        LoadingView(isShowing: $viewModel.isLoading, content: buildContent)
    }

    private func buildContent() -> some View {
        ZStack(alignment: .center) {
            buildWordContent()
            buildStarsContent()
        }
        .alert(isPresented: $viewModel.isError, content: {
            Alert(title: Text("Error"),
                  message: Text(viewModel.errorMessage ?? ""),
                  dismissButton: .default(Text("OK"))
            )
        })
    }

    private func buildWordContent() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center) {
                Text("\(viewModel.currentWord.name) "
                    + "[ \(viewModel.currentWord.transcription) ] , "
                    + "\(viewModel.currentWord.pos)"
                )
                ViewStyles.imageButton(
                    image: R.image.record_audio_icon()!,
                    action: { self.viewModel.recordWord() }
                )
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer().frame(height: 16)
            buildLearningContent()
            Spacer()
            buildBottomButtons()
        }
        .padding(.bottom, 16)
        .padding(.horizontal, 16)
    }

    private func buildLearningContent() -> some View {
        switch viewModel.learningState {
        case .hidden:
            return AnyView(
                HStack(alignment: .center, spacing: 32) {
                    ViewStyles.imageButtonWithText(
                        image: R.image.show_icon()!,
                        text: "Examples",
                        action: viewModel.showExamples
                    ).frame(width: 100)
                    ViewStyles.imageButtonWithText(
                        image: R.image.quiz_icon()!,
                        text: "Quiz",
                        action: viewModel.showQuiz
                    ).frame(width: 100)
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            )
        case .examples:
            return AnyView(Text(viewModel.currentWord.examples.joined(separator: "\n\n")))
        case .quiz:
            return AnyView(QuizView(quiz: viewModel.currentWord.quiz))
        }
    }

    private func buildBottomButtons() -> some View {
        HStack(alignment: .center, spacing: 24) {
            ViewStyles.secondaryButton(
                text: "I don’t know this word",
                action: { self.viewModel.setWordStatus(.unknown) }
            )
            ViewStyles.primaryButton(
                text: "I know this word",
                action: { self.viewModel.setWordStatus(.known) }
            )
        }
    }

    private func buildStarsContent() -> some View {
        Group {
            if viewModel.score != nil {
                HStack(alignment: .center, spacing: 16) {
                    Star(corners: 5, smoothness: 0.45)
                        .fill(viewModel.score! >=  1 ? Color.yellow : Color.white)
                        .frame(width: 50, height: 50)
                    Star(corners: 5, smoothness: 0.45)
                        .fill(viewModel.score! >= 2 ? Color.yellow : Color.white)
                        .frame(width: 50, height: 50)
                    Star(corners: 5, smoothness: 0.45)
                        .fill(viewModel.score! >= 3 ? Color.yellow : Color.white)
                        .frame(width: 50, height: 50)
                }
                .frame(width: 200, height: 80)
                .background(Color.gray)
                .cornerRadius(16, antialiased: true)
            } else {
                EmptyView()
            }
        }
    }

}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordsView(viewModel: WordsViewModel(coordinator: AppCoordinator(), words: [Word]()))
    }
}
