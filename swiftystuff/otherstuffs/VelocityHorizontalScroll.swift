//
//  ContentView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 19/10/2024.
//

import SwiftUI

@available(iOS 18.0, *)
struct HorizontalScrollingView: View {
    @State private var lastOffset: CGPoint = .zero
    @State private var lastTime: Date = .init()

    @State private var velocityX: CGFloat = .zero
    @State private var velocityY: CGFloat = .zero

    func calculateVelocity(currentOffset: CGPoint) {
        let timeInterval = Date().timeIntervalSince(lastTime)
        if timeInterval > 0.1 {
            let offsetDifference = CGPoint(
                x: currentOffset.x - lastOffset.x,
                y: currentOffset.y - lastOffset.y
            )

            // Calculate the velocity using the offset difference and time interval

            velocityX = offsetDifference.x / CGFloat(timeInterval)
            velocityY = offsetDifference.y / CGFloat(timeInterval)
        }
    }

    var body: some View {
        VStack {
            Text("velocity Y: \(velocityY), velocity X: \(velocityX)")

            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(0 ..< 100) { index in
                        Text("Item \(index)")
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .rotationEffect(.degrees(velocityX / 100))
                    }
                }
                .scrollTargetLayout()
                .padding()
            }
            .onScrollPhaseChange { _, newPhase, ctx in
                print(newPhase)
                if newPhase == .interacting {
                    self.calculateVelocity(currentOffset: ctx.geometry.contentOffset)
                } else if newPhase == .decelerating {
                    self.calculateVelocity(currentOffset: ctx.geometry.contentOffset)
                } else if newPhase == .idle {
                    lastOffset = ctx.geometry.contentOffset
                    lastTime = .init()

                    velocityX = .zero
                    velocityY = .zero
                }
            }
        }
    }
}

#Preview {
    if #available(iOS 18.0, *) {
        HorizontalScrollingView()
    } else {
        // Fallback on earlier versions
    }
}
