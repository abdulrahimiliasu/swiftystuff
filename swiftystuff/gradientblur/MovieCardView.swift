//
//  MovieCardView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 21/01/2024.
//

import SwiftUI

struct MovieCardView: View {
    let movie: Movie
    @State private var isShowDetails: Bool = true

    var body: some View {
        ZStack {
            Image(movie.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(.rect(cornerRadius: 20))
                .zIndex(0)
                .overlay(alignment: .topTrailing) {
                    DetailsButton(isShowDetails: $isShowDetails)
                        .padding()
                }

            if isShowDetails {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                    .zIndex(1)
                Image(movie.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(.rect(cornerRadius: 20))
                    .mask(LinearGradient(stops: [.init(color: .white, location: 0),
                                                 .init(color: .white, location: 0.4),
                                                 .init(color: .clear, location: 0.65),
                                                 .init(color: .clear, location: 0.8)],
                                         startPoint: .top, endPoint: .bottom))
                    .zIndex(2)
                    .overlay(alignment: .topTrailing) {
                        DetailsButton(isShowDetails: $isShowDetails)
                            .padding()
                    }
                    .overlay(alignment: .bottom) {
                        MovieDetailsView(movie: movie)
                    }
            }
        }
        .frame(width: 350, height: 520)
        .padding()
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0.0, y: 25)
    }
}
