//
//  ToggleAnimationButton.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 26/05/2024.
//

import SwiftUI

struct ToggleAnimationButton: View {
    @Binding var isShowAnimation: Bool
    @State private var symbolEffectValue = false

    func toggleAnimation() {
        withAnimation {
            isShowAnimation.toggle()
            symbolEffectValue.toggle()
        }
    }

    var body: some View {
        Button { toggleAnimation() } label: {
            HStack {
                Image(systemName: isShowAnimation ? "circle.fill" : "circle")
                    .symbolEffect(.bounce.down, value: symbolEffectValue)
                    .foregroundStyle(isShowAnimation ? .green : .primary)
                Text("Toggle animation")
            }
        }
        .foregroundStyle(.primary)
    }
}
