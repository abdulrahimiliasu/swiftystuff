//
//  ShowDetailsButton.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 21/01/2024.
//

import SwiftUI

struct DetailsButton: View {
    @Binding var isShowDetails: Bool

    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.3)) {
                isShowDetails.toggle()
            }
        }, label: {
            Label("Button", systemImage: isShowDetails ? "eye.slash" : "eye")
                .padding(10)
                .labelStyle(.iconOnly)
                .font(.system(size: 10, weight: .bold))
                .tint(.white)
                .background(
                    Circle()
                        .fill(.thinMaterial)
                )
        })
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0.0, y: 10)
    }
}
