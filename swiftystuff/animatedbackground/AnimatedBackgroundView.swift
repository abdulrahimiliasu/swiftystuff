//
//  AnimatedBackgroundView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 05/05/2024.
//
import SwiftUI

struct AnimatedBackgroundView: View {
    @State private var isShowAnimation = false
    var body: some View {
        GeometryReader { proxy in
            VStack {
                VStack(alignment: .leading) {
                    if isShowAnimation {
                        ForEach(texts.indices, id: \.self) { index in
                            Text(texts[index])
                                .transition(getIndexTransition(index))
                                .opacity(getIndexOpacity(index, size: texts.count))
                        }
                    }
                }
                .frame(minHeight: 500)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0.0, y: 10)
                .font(.system(size: 30, weight: .bold))
                ToggleAnimationButton(isShowAnimation: $isShowAnimation)
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
            .background(AnimatedBackground())
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    AnimatedBackgroundView()
}

/// Animated background based on phases
private struct AnimatedBackground: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 150)
                .phaseAnimator(phases, content: { content, phase in
                    content
                        .overlay(phase)
                        .blur(radius: 180.0)

                }, animation: { _ in .easeInOut(duration: 3) })
            Spacer()
        }
    }
}
