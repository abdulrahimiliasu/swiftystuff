//
//  MovieCardView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 21/01/2024.
//

import SwiftUI

struct ShowDetailsModifier: ViewModifier {
    @Binding var isShowDetails: Bool

    func body(content: Content) -> some View {
        content
            .overlay(alignment: .topTrailing) {
                DetailsButton(isShowDetails: $isShowDetails)
                    .padding()
            }
    }
}

extension View {
    func withDetailsButton(_ isShowDetails: Binding<Bool>) -> some View {
        modifier(ShowDetailsModifier(isShowDetails: isShowDetails))
    }
}

struct MovieCardView: View {
    let movie: Movie
    @State private var isShowDetails: Bool = true

    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center) {
                ZStack {
                    Image(movie.image)
                        .resizable()
                        .clipShape(.rect(cornerRadius: 20))
                        .zIndex(0)
                        .withDetailsButton($isShowDetails)

                    if isShowDetails {
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .clipShape(.rect(cornerRadius: 20))
                            .zIndex(1)
                        Image(movie.image)
                            .resizable()
                            .clipShape(.rect(cornerRadius: 20))
                            .mask(LinearGradient(stops: [.init(color: .white, location: 0),
                                                         .init(color: .white, location: 0.4),
                                                         .init(color: .clear, location: 0.65),
                                                         .init(color: .clear, location: 0.8)],
                                                 startPoint: .top, endPoint: .bottom))
                            .zIndex(2)
                            .withDetailsButton($isShowDetails)
                            .overlay(alignment: .bottom) {
                                MovieDetailsView(movie: movie)
                                    .padding()
                            }
                    }
                }
                .frame(width: 350, height: 520)
                .padding()
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 20)
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}

#Preview {
    MovieCardView(movie: movies[2])
}
