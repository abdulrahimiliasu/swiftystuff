//
//  ButtonPressModifier.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 07/09/2024.
//

import SwiftUI

struct RevealingButtonModifier: ViewModifier {
    @Binding var isShowing: Bool
    @Binding var isPressing: Bool
    @Binding var isShowingCircularProgress: Bool

    func body(content: Content) -> some View {
        content
            .foregroundStyle(isPressing || isShowing ? .orange : .purple)
            .rotationEffect(.degrees(isPressing || isShowing ? 135 : 0))
            .overlay(ButtonCircularProgressView(isPressing: $isShowingCircularProgress, isShowing: $isShowing))
            .font(.largeTitle)
            .symbolEffect(.bounce, value: isShowing)
            .scaleEffect(isShowing || isPressing ? 1.5 : 1)
    }
}
