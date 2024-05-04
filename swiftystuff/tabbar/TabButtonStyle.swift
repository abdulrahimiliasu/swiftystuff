//
//  TabButtonStyle.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 28/04/2024.
//

import Foundation
import SwiftUI

struct TabButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .opacity(configuration.isPressed ? 0.9 : 1)
    }
}

extension View {
    func withTabButtonStyle() -> some View {
        buttonStyle(TabButtonStyle())
    }
}
