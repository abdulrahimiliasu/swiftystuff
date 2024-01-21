//
//  MovieDetailsView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 21/01/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: Movie

    var body: some View {
        VStack(spacing: 10) {
            VStack(spacing: 10) {
                Text(movie.genre)
                    .font(.footnote)
                Text(movie.date)
                    .font(.caption)
            }
            .foregroundStyle(.secondary)

            HStack {
                Button("Watch it on \(movie.streamingOn) now") {}
                    .padding(10)
                    .buttonStyle(.plain)
                    .font(.system(size: 10, weight: .bold))
                    .background(
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(.ultraThickMaterial)
                    )
                Button("Save for later") {}
                    .padding(10)
                    .buttonStyle(.plain)
                    .font(.system(size: 10, weight: .semibold))
                    .background(
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(.thinMaterial)
                    )
            }
            Text(movie.details)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    MovieDetailsView(movie: movies[0])
}
