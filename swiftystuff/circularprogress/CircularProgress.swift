//
//  Extensions.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 03/06/2024.
//

import SwiftUI

struct CircularProgressBackground: View {
    @Binding var animationPhase: AnimationPhase
    var body: some View {
        Circle()
            .rotation(.degrees(-90))
            .stroke(.tertiary.opacity(0.15), style: .init(lineWidth: 15, lineCap: .round))
            .transition(.blurReplace(.downUp).animation(.bouncy))
            .opacity(animationPhase == .finish || animationPhase == .initial ? 0 : 1)
    }
}

struct CircularProgressIndicator: View {
    @Binding var animationPhase: AnimationPhase
    var body: some View {
        Circle()
            .trim(from: animationPhase.values.from, to: animationPhase.values.to)
            .rotation(.degrees(-90))
            .stroke(.green, style: .init(lineWidth: animationPhase.values.lineWidth, lineCap: .round))
            .shadow(color: .black.opacity(animationPhase == .finish ? 0 : 0.1), radius: 10, x: 0, y: 5)
            .transition(.blurReplace(.upUp).animation(.bouncy))
    }
}
