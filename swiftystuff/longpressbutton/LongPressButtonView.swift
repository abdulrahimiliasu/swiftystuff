//
//  DeleteButtonView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 22/10/2024.
//

import SwiftUI

struct LongPressButtonView: View {
    @State private var isPressing = false
    @State private var isPressed = false

    let gestureDuration: TimeInterval = 1
    let accentColor: Color = .green
    let systemImage: String = "tree.fill"
    let buttonText: String = "Tree mode"

    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .fill(.green)
                .frame(width: isPressed ? 1000 : 0, height: isPressed ? 1000 : 0)
                .opacity(isPressed ? 0.1 : 0)
            VStack(spacing: 10) {
                Image(systemName: systemImage)
                    .font(.system(size: 25))
                    .scaleEffect(isPressing || isPressed ? 2 : 1)
                    .symbolRenderingMode(isPressed ? .monochrome : .multicolor)
                    .symbolEffect(.bounce, value: isPressed)

                if !isPressing && !isPressed {
                    Text(buttonText)
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .transition(.move(edge: .bottom).combined(with: .blurReplace))
                }
            }
            .frame(width: 100, height: 100)
            .foregroundStyle(isPressed ? .white : .gray)
            .background(
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(isPressed ? accentColor : .gray.opacity(0.15))
                    Rectangle()
                        .frame(width: isPressing ? 150 : 10, height: 100)
                        .opacity(isPressing ? 0.1 : 0)
                }
            )
            .clipShape(.rect(cornerRadius: 20))
            .onLongPressGesture(minimumDuration: gestureDuration) {
                withAnimation(.bouncy) {
                    isPressed.toggle()
                }

            } onPressingChanged: { isPressing in
                withAnimation(.spring(duration: gestureDuration)) {
                    self.isPressing = isPressing
                }
            }
        }
    }
}

#Preview {
    LongPressButtonView()
}
