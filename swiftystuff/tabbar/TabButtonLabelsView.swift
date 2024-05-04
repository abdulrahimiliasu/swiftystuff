//
//  TabButtonLabelsView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 04/05/2024.
//

import SwiftUI

let BTTN_HEIGHT: CGFloat = 50
let CORNER_RADIUS: CGFloat = 35.0

struct ActiveTabLabel: View {
    let tabItem: TabItem

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: CORNER_RADIUS)
                .fill(tabItem.color.opacity(0.1))
                .shadow(color: .primary.opacity(0.5), radius: 3, x: 0, y: 5)
                .frame(width: 120, height: BTTN_HEIGHT)
            Label(tabItem.title, systemImage: tabItem.systemImage)
                .labelStyle(.titleAndIcon)
        }
    }
}

struct InActiveTabLabel: View {
    let tabItem: TabItem

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: CORNER_RADIUS)
                .fill(.clear)
                .frame(width: 50, height: BTTN_HEIGHT)
            Label(tabItem.title, systemImage: tabItem.systemImage)
                .labelStyle(.iconOnly)
                .symbolEffectsRemoved()
        }
    }
}
