//
//  TabBarContentView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 04/05/2024.
//

import SwiftUI

struct WithTabBar<Content>: View where Content: View {
    @State private var selection: Tabs = .home
    @ViewBuilder var content: (Tabs) -> Content

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                content(selection)
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
            .overlay(alignment: .bottom) {
                TabBar(selection: $selection)
                    .padding()
            }
        }
    }
}

struct TabBar: View {
    @Binding var selection: Tabs
    @State private var symbolTrigger: Bool = true
    @Namespace private var tabItemNameSpace

    func changeTabTo(_ tab: Tabs) {
        withAnimation(.bouncy(duration: 0.3, extraBounce: 0.15)) {
            selection = tab
        }
        symbolTrigger.toggle()
    }

    var body: some View {
        HStack(spacing: 10) {
            ForEach(Tabs.allCases, id: \.self) { tab in
                Button(action: {
                    changeTabTo(tab)
                }) {
                    if tab == selection {
                        ActiveTabLabel(tabItem: tab.item)
                            .matchedGeometryEffect(id: "tabItem", in: tabItemNameSpace)
                    } else {
                        InActiveTabLabel(tabItem: tab.item)
                    }
                }
                .symbolEffect(.bounce.up.byLayer, value: symbolTrigger)
                .foregroundStyle(tab.item.color)
                .withTabButtonStyle()
            }
        }
        .padding(10)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 35.0))
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
    }
}

#Preview {
    WithTabBar { selection in
        Text("Hello world")
            .foregroundStyle(selection.item.color)
    }
}
