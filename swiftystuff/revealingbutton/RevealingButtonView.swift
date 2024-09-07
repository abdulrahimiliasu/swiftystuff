//
//  RevealingButtonView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 20/08/2024.
//

import SwiftUI

struct RevealingButtonView: View {
    @State private var isShowing = false
    @State private var isShowingCircularProgress = false
    @State private var isPressing = false

    let gestureDuration = 1.0

    func toggleShowButtons() {
        withAnimation(.spring) {
            self.isShowing.toggle()
        }
    }

    func toggleDidPressButton(_ isPressing: Bool) {
        withAnimation(.bouncy(extraBounce: 0.1)) {
            guard isShowing else {
                self.isPressing = isPressing
                toggleShowCircularProgress(isPressing)
                return
            }
            isShowing.toggle()
        }
    }

    func toggleShowCircularProgress(_ isPressing: Bool) {
        withAnimation(.linear(duration: gestureDuration)) {
            self.isShowingCircularProgress = isPressing
        }
    }

    var body: some View {
        VStack(spacing: 15) {
            if isShowing {
                ButtonsView()
            }

            ZStack {
                Label("Add something", systemImage: "plus.circle.fill")
                    .withRevealingButtonModifier(isShowing, isPressing, isShowingCircularProgress)
                    .onLongPressGesture(minimumDuration: gestureDuration) {
                        toggleShowButtons()
                    } onPressingChanged: { isPressing in
                        toggleDidPressButton(isPressing)
                    }
            }
        }
        .labelStyle(.iconOnly)
    }
}

#Preview {
    RevealingButtonView()
}
