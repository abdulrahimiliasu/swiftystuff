//
//  TargetIndicatorView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 18/08/2024.
//

import SwiftUI

struct TargetIndicatorView: View {
    var body: some View {
        Image(systemName: "triangle.fill")
            .rotationEffect(.degrees(180))
            .font(.title)
            .foregroundStyle(.red)
            .offset(y: -50)
    }
}

#Preview {
    TargetIndicatorView()
}
