//
//  ButtonPressModifier.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 07/09/2024.
//

import SwiftUI

struct RevealingButtonModifier: ViewModifier {
    let isShowing: Bool
    let isPressing: Bool
    let isShowingCircularProgress: Bool

    init(_ isShowing: Bool, _ isPressing: Bool, _ isShowingCircularProgress: Bool) {
        self.isShowing = isShowing
        self.isPressing = isPressing
        self.isShowingCircularProgress = isShowingCircularProgress
    }

    func body(content: Content) -> some View {
        content
            .foregroundStyle(isPressing || isShowing ? .orange : .purple)
            .rotationEffect(.degrees(isPressing || isShowing ? 135 : 0))
            .font(.largeTitle)
            .symbolEffect(.bounce, value: isShowing)
            .overlay(ButtonCircularProgressView(isShowingCircularProgress, isShowing))
            .scaleEffect(isShowing || isPressing ? 1.5 : 1)
    }
}

extension View {
    func withRevealingButtonModifier(_ isShowing: Bool, _ isPressing: Bool, _ isShowingCircularProgress: Bool) -> some View {
        modifier(RevealingButtonModifier(isShowing, isPressing, isShowingCircularProgress))
    }
}
