//
//  AnimatedBackgroundView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 05/05/2024.
//
import SwiftUI

let texts = ["Really Simple", "Animations", "In Swift UI", "With", "Animated Background", "& Animated Text"]
let phases: [Color] = [.blue, .red, .green, .orange, .yellow, .purple, .mint, .pink]

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

/// Calculates and returns the opacity of a view based on it's index in for-each loop
private func getIndexOpacity(_ index: Int, size: Int) -> Double {
    return Double(1 - Double(index) / Double(size)) * 0.9
}

/// Calculates and returns  the transition delay of a view based on it's index in for-each loop
private func getIndexTransition(_ index: Int) -> some Transition {
    return .blurReplace(.upUp).animation(.bouncy.delay(Double(index) * 0.3))
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
