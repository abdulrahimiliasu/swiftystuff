//
//  TabBarView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 21/04/2024.
//

import MapKit
import SwiftUI

struct TabBarView: View {
    var body: some View {
        WithTabBar { selection in
            switch selection {
                case .home:
                    TabScrollContentView(tab: .home)
                case .discover:
                    TabScrollContentView(tab: .discover)
                case .profile:
                    TabScrollContentView(tab: .profile)
                case .settings:
                    TabScrollContentView(tab: .settings)
            }
        }
    }
}

#Preview {
    TabBarView()
}
