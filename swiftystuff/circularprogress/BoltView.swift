//
//  BoltView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 03/06/2024.
//

import SwiftUI

struct BoltView: View {
    @Binding var symbolEffectValue: Bool
    var body: some View {
        Image(systemName: "bolt.fill")
            .symbolEffect(.bounce.down, value: symbolEffectValue)
            .font(.system(size: 100))
            .foregroundStyle(.green)
    }
}

#Preview {
    BoltView(symbolEffectValue: .constant(false))
}
