//
//  ButtonsView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 07/09/2024.
//

import SwiftUI

struct ButtonsView: View {
    var body: some View {
        VStack {
            IconButton(systemImage: "menucard.fill", color: .purple)
            IconButton(systemImage: "lasso", color: .orange)
            IconButton(systemImage: "dumbbell.fill", color: .blue)
            IconButton(systemImage: "doc.append.fill.rtl", color: .red)
        }
        .transition(.asymmetric(insertion: .scale.combined(with: .offset(y: 50)), removal: .scale.combined(with: .opacity)))
    }
}

private struct IconButton: View {
    let text = ""
    let systemImage: String
    let color: Color

    var body: some View {
        Button(text, systemImage: systemImage) {}
            .foregroundStyle(color)
            .padding(10)
            .background(Circle().foregroundStyle(color.opacity(0.2)))
    }
}

#Preview {
    ButtonsView()
}
