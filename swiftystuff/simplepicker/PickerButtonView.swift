//
//  PickerButtonView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 2025. 01. 18..
//

import SwiftUI

struct PickerButton: View {
    let title: String

    @Binding var selected: [String]
    @State private var isSelected: Bool = false

    var body: some View {
        HStack {
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.green)
                    .symbolEffect(.bounce, value: isSelected)
            }
            Text(title)
                .font(.system(size: 15, weight: .semibold, design: .rounded))
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .stroke(isSelected ? .green : .secondary, style: .init(lineWidth: isSelected ? 2 : 1, lineCap: .round, lineJoin: .round))
        )
        .onTapGesture {
            withAnimation(.bouncy(duration: 0.2, extraBounce: 0.3)) {
                isSelected.toggle()
                selected.append(title.lowercased())
            }
        }
    }
}
