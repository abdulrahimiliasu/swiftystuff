//
//  ProgressButton.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 12/10/2024.
//

import SwiftUI

private struct MeshAnimationColors {
    let points: [SIMD2<Float>]
    let colors: [Color]
    let name: String
}

private enum MeshAnimationPhase {
    case initial, processing, done

    @available(iOS 18.0, *)
    var value: MeshAnimationColors {
        switch self {
        case .initial:
            return .init(points:
                [
                    [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                    [0.0, 0.5], [0.8, 0.2], [1.0, 0.5],
                    [0.0, 1.0], [0.5, 1.0], [1.0, 1.0],
                ], colors: [
                    .purple, .red, .purple,
                    .purple, .orange, .purple,
                    .pink, .red, .pink,
                ], name: "Verify")
        case .processing:
            return .init(points:
                [
                    [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                    [0.0, 0.5], [0.3, 0.2], [1.0, 0.5],
                    [0.0, 1.0], [0.5, 1.0], [1.0, 1.0],
                ], colors: [
                    .red, .orange, .indigo,
                    .red, .red, .orange,
                    .green, .green, .green,
                ], name: "Verifying")

        case .done:
            return .init(points:
                [
                    [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                    [0.0, 0.5], [0.1, 0.8], [1.0, 0.5],
                    [0.0, 1.0], [0.5, 1.0], [1.0, 1.0],
                ], colors: [
                    .blue, .indigo, .cyan,
                    .green, .green, .green,
                    .green, .green, .green,
                ], name: "Verified")
        }
    }
}

@available(iOS 18.0, *)
private struct ButtonTextView: View {
    @Binding var phase: MeshAnimationPhase

    var body: some View {
        HStack {
            Text(phase.value.name)
                .contentTransition(.numericText())
            switch phase {
            case .initial:
                Image(systemName: "exclamationmark.circle.fill")
                    .symbolEffect(.wiggle, options: .repeat(.continuous), isActive: true)
            case .processing:
                Image(systemName: "ellipsis")
                    .symbolEffect(.variableColor, options: .repeat(.continuous), isActive: true)
            case .done:
                Image(systemName: "checkmark.seal.fill")
                    .symbolEffect(.bounce, options: .repeat(1), isActive: true)
            }
        }
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
        .font(.system(size: 20, weight: .bold, design: .rounded))
        .foregroundStyle(.white)
    }
}

@available(iOS 18.0, *)
struct MeshGradientButtonView: View {
    @State private var phase: MeshAnimationPhase = .initial

    var body: some View {
        VStack {
            Capsule(style: .continuous)
                .fill(
                    MeshGradient(width: 3, height: 3, points: phase.value.points, colors: phase.value.colors)
                )
                .overlay {
                    ButtonTextView(phase: $phase)
                }
                .frame(width: 300, height: 70)
                .onTapGesture {
                    withAnimation(.smooth(duration: 1, extraBounce: 0.5)) {
                        switch phase {
                        case .initial:
                            self.phase = .processing
                        case .processing:
                            self.phase = .done
                        case .done:
                            self.phase = .initial
                        }
                    }
                }
                .contentShape(.capsule)
        }
    }
}

#Preview {
    if #available(iOS 18.0, *) {
        MeshGradientButtonView()
    } else {
        // Fallback on earlier versions
        Text("This view is only available in iOS 18 and newer")
    }
}
