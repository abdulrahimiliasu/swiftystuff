//
//  ProgressiveBlurView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 21/01/2024.
//

import SwiftUI

struct GradientBlurView: View {
    var body: some View {
        NavigationView {
            VStack {
                ProfileView()
                    .padding()
                Text("Currently Watching")
                    .bold()
                    .foregroundStyle(.secondary)
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(movies) { movie in
                            MovieCardView(movie: movie)
                                .containerRelativeFrame(.horizontal, count: 1, span: 1, spacing: 0, alignment: .center)
                                .scrollTransition { content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1 : 0)
                                        .scaleEffect(phase.isIdentity ? 1 : 0.7)
                                        .blur(radius: phase.isIdentity ? 0 : 5)
                                        .offset(y: phase.isIdentity ? 0 : 150)
                                }
                        }
                    }
                    .scrollTargetLayout()
                }
            }
        }
        .scrollTargetBehavior(.viewAligned)
        .scrollClipDisabled()
        .scrollIndicators(.hidden)
    }
}

#Preview {
    GradientBlurView()
}
