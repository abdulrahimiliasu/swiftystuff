//
//  Utils.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 26/05/2024.
//

import SwiftUI

let texts = ["Really Simple", "Animations", "In Swift UI", "With", "Animated Background", "& Animated Text"]
let phases: [Color] = [.blue, .red, .green, .orange, .yellow, .purple, .mint, .pink]

/// Calculates and returns the opacity of a view based on it's index in for-each loop
func getIndexOpacity(_ index: Int, size: Int) -> Double {
    return Double(1 - Double(index) / Double(size)) * 0.9
}

/// Calculates and returns  the transition delay of a view based on it's index in for-each loop
func getIndexTransition(_ index: Int) -> some Transition {
    return .blurReplace(.upUp).animation(.bouncy.delay(Double(index) * 0.3))
}
