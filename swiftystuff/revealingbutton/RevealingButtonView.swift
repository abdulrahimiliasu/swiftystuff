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

    func handleGestureFinished() {
        withAnimation(.spring) {
            self.isShowing.toggle()
        }
    }

    func handleIsPressingButton(_ isPressing: Bool) {
        withAnimation(.bouncy(extraBounce: 0.1)) {
            if isPressing && isShowing {
                isShowing = false
                return
            }

            self.isPressing = isPressing
            toggleShowCircularProgress(isPressing)
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
                    .modifier(RevealingButtonModifier(isShowing: $isShowing, isPressing: $isPressing, isShowingCircularProgress: $isShowingCircularProgress))
                    .onLongPressGesture(minimumDuration: gestureDuration) {
                        handleGestureFinished()
                    } onPressingChanged: { isPressing in
                        handleIsPressingButton(isPressing)
                    }
            }
        }
        .labelStyle(.iconOnly)
    }
}

#Preview {
    RevealingButtonView()
}
