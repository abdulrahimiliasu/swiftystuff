//
//  SliderView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 18/08/2024.
//

import SwiftUI

struct SliderBackgroundView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 2.0)
            .foregroundStyle(.black.opacity(0.95).gradient)
    }
}

struct SliderIndicator: View {
    let index: Int

    var body: some View {
        VStack {
            Text(String(index))
                .foregroundStyle(.white)
                .font(.system(size: 25, weight: .semibold, design: .rounded))
            LowerIndicatorsView()
        }
    }
}

#Preview {
    SliderIndicator(index: 12)
}
