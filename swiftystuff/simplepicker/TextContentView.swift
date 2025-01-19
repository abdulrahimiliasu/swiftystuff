//
//  TextContentView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 2025. 01. 18..
//

import SwiftUI

struct TextContentView: View {
    let content: TextContentModel

    var body: some View {
        HStack(alignment: .top) {
            VStack {
                Image(systemName: content.iconName)
                    .foregroundStyle(.secondary)
                RoundedRectangle(cornerRadius: 10.0)
                    .frame(width: 1.5)
                    .foregroundStyle(.tertiary)
            }
            VStack(alignment: .leading) {
                Text(content.title)
                    .font(.system(.headline, design: .rounded, weight: .semibold))
                Text("31 Dec 2024")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                Text(content.description)
                    .font(.subheadline)
            }
        }
    }
}
