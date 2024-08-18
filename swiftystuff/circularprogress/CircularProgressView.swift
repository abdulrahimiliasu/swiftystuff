//
//  CircularProgressView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 01/06/2024.
//

import SwiftUI

private let duration: TimeInterval = 0.6

struct CircularProgressView: View {
    @State private var isShowAnimation = false
    @State private var symbolEffectValue = false
    @State private var animationPhase: AnimationPhase = .initial

    var body: some View {
        ZStack {
            LockScreenView()
                .blur(radius: isShowAnimation ? 50 : 0)
            VStack {
                ZStack {
                    if isShowAnimation {
                        CircularProgressBackground(animationPhase: $animationPhase)
                        CircularProgressIndicator(animationPhase: $animationPhase)
                            .background(BoltView(symbolEffectValue: $symbolEffectValue))
                    }
                }
                .padding(.horizontal, 40)
                Spacer()
                Button("Toggle animation") { animateCircularProgress() }
                    .foregroundStyle(.primary)
                    .phaseAnimator([0, 10], content: { content, phase in
                        content.offset(y: phase)
                    }, animation: { _ in .easeInOut.speed(0.5) })
            }
        }
    }
}

extension CircularProgressView {
    func toggleAnimation() {
        animationPhase = .initial
        withAnimation { isShowAnimation.toggle() }
    }

    /// Set phase to start
    func startAnimation() {
        toggleAnimation()
        withAnimation(.snappy(duration: duration)) { animationPhase = .start }
    }

    /// Set phase to finish
    func finishAnimation() {
        withAnimation(.snappy(duration: duration), completionCriteria: .logicallyComplete)
            { animationPhase = .finish }
            completion: { toggleAnimation() }
    }

    /// Animate based on phase
    func animateCircularProgress() {
        isShowAnimation ? finishAnimation() : startAnimation()
        symbolEffectValue.toggle()
    }
}

#Preview {
    CircularProgressView()
}
