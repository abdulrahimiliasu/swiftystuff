//
//  ModalContentView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 20/04/2024.
//

import SwiftUI

struct AlertDurationIndicator: View {
    let duration: TimeInterval

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 50, height: 5)
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(Color.gray.opacity(0.4))
                .frame(height: 5)
                .keyframeAnimator(initialValue: 0, repeating: true) { content, value in
                    content
                        .frame(width: value)
                } keyframes: { _ in
                    KeyframeTrack {
                        LinearKeyframe(10, duration: duration)
                        LinearKeyframe(20, duration: duration)
                        LinearKeyframe(30, duration: duration)
                        LinearKeyframe(40, duration: duration)
                        LinearKeyframe(50, duration: duration)
                    }
                }
        }
    }
}

struct AlertBody: View {
    let modal: AlertModal
    let duration: TimeInterval
    // TODO: Dismiss after duration

    var body: some View {
        VStack(spacing: 20) {
            AlertDurationIndicator(duration: duration)
                .padding(.bottom, 25)
            Image(systemName: modal.icon)
                .font(.system(size: 70))
                .foregroundStyle(modal.color)
                .symbolRenderingMode(.hierarchical)
                .symbolEffect(.pulse)
            VStack(spacing: 10) {
                Text(modal.heading)
                    .font(.title2)
                    .bold()
                Text(modal.subHeading)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            // TODO: Add onAction Button
        }
    }
}

struct ModalContentView: View {
    @EnvironmentObject var alert: AlertManager

    var body: some View {
        AlertBody(modal: alert.modal, duration: 0.5)
            .presentationBackgroundInteraction(.disabled)
            .presentationBackground(.linearGradient(colors: [Color.clear, alert.modal.color.opacity(0.2)], startPoint: .top, endPoint: .bottom))
            .presentationDetents([.height(290)])
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("bgColor"))
            .clipShape(.rect(cornerRadius: 30.0))
            .padding()
    }
}

#Preview {
    ModalContentView()
        .environmentObject(AlertManager())
}
