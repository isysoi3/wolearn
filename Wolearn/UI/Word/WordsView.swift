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
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center) {
                Text("\(viewModel.currentWord.name) "
                    + "[ \(viewModel.currentWord.transcription) ] , "
                    + "\(viewModel.currentWord.pos)"
                )
                ViewStyles.imageButton(
                    image: R.image.record_audio_icon()!,
                    action: { self.viewModel.tmp() }
                )
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer().frame(height: 16)
            Text(viewModel.currentWord.examples.joined(separator: "\n\n"))
            Spacer()
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
        .padding(.bottom, 16)
        .padding(.horizontal, 16)
        .alert(isPresented: $viewModel.isError, content: {
            Alert(title: Text("Error"),
                  message: Text(viewModel.errorMessage ?? ""),
                  dismissButton: .default(Text("OK"))
            )
        })
    }

}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordsView(viewModel: WordsViewModel(coordinator: AppCoordinator(), words: [Word]()))
    }
}
