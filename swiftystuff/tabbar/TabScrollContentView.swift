//
//  TabScrollContentView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 04/05/2024.
//

import SwiftUI

struct TabScrollContentView: View {
    let tab: Tabs

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach((1 ... 3).reversed(), id: \.self) { _ in
                        RoundedRectangle(cornerRadius: 25)
                            .fill(tab.item.color.opacity(0.5))
                            .frame(height: 180)
                            .scrollTransition { content, phase in
                                content
                                    .scaleEffect(phase.isIdentity ? 1 : 0.8)
                                    .blur(radius: phase.isIdentity ? 0 : 10)
                            }
                    }
                }
                .padding()
            }
            .navigationTitle(tab.item.title)
        }
    }
}

#Preview {
    TabScrollContentView(tab: .home)
}
