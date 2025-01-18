//
//  PrimaryButton.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 2025. 01. 18..
//

import SwiftUI

private struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.bouncy(duration: 0.15, extraBounce: 0.2), value: configuration.isPressed)
    }
}

struct PrimaryButton: View {
    let title: String
    let bgColor: Color
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous).fill(bgColor)
                    .frame(maxHeight: 50)
                    .shadow(color: bgColor.opacity(0.08), radius: 2, x: 0, y: 5)
                Label(title, systemImage: "")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }

        })
        .buttonStyle(PrimaryButtonStyle())
    }
}
