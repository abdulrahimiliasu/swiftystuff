//
//  WordDetailsView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 20/04/2024.
//

import SwiftUI

struct WordDetailsView: View {
    let word: Word

    @State private var isShowDetails: Bool = false
    @State private var isSaved: Bool = true

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(word.partOfSpeech)
                    .fontWeight(.light)
                    .foregroundStyle(.secondary)
                Spacer()
                Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                    .foregroundStyle(.red)
                    .onTapGesture {
                        withAnimation { isSaved.toggle() }
                    }
            }

            Text(word.title)
                .font(.largeTitle)
                .bold()
                .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 10)
                .onTapGesture { isShowDetails.toggle() }
            HStack {
                Button("Play Sound", systemImage: "speaker.wave.3.fill") {}
                    .tint(.primary)
                    .labelStyle(.iconOnly)
                    .buttonStyle(.bordered)
                Text(word.phonetic)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(20)
        .fontDesign(.serif)
    }
}

#Preview {
    WordDetailsView(word: words[0])
}
