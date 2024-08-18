//
//  ScollingStackView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 23/06/2024.
//

import SwiftUI

struct ScollingStackView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ..< 20) { _ in
                    RoundedRectangle(cornerRadius: 24)
                        .fill(.blue)
                        .frame(height: 100)
                        .visualEffect { content, proxy in
                            let frame = proxy.frame(in: .scrollView(axis: .vertical))
                            let _ = proxy
                                .bounds(of: .scrollView(axis: .vertical)) ??
                                .infinite

                            // The distance this view extends past the bottom edge
                            // of the scroll view.
                            let distance = min(0, frame.minY)

                            return content
                                .hueRotation(.degrees(frame.origin.y / 20))
                                .scaleEffect(1 + distance / 800)
                                .offset(y: -distance / 1.25)
                                .brightness(-distance / 400)
                                .blur(radius: -distance / 50)
                        }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ScollingStackView()
}
