//
//  ButtonCircularProgressView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 07/09/2024.
//

import SwiftUI

struct ButtonCircularProgressView: View {
    let isPressing: Bool
    let isShowing: Bool

    init(_ isPressing: Bool, _ isShowing: Bool) {
        self.isPressing = isPressing
        self.isShowing = isShowing
    }

    var body: some View {
        Circle()
            .rotation(.degrees(270))
            .trim(from: 0.0, to: isPressing ? 1.2 : 0.0)
            .stroke(style: .init(lineWidth: 2, lineCap: .round))
            .foregroundStyle(isPressing ? .green : .orange)
            .opacity(isShowing && !isPressing ? 0 : 1)
    }
}
