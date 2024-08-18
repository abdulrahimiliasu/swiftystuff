//
//  ContentView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 21/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Progressive Blur") {
                    GradientBlurView()
                }
                NavigationLink("Alert Modal") {
                    AlertModalView()
                }
                NavigationLink("Vertical Scroll View") {
                    VerticalScrollingView()
                }
                NavigationLink("TabBar View") {
                    TabBarView()
                }
                NavigationLink("Animated Background View") {
                    AnimatedBackgroundView()
                }
                NavigationLink("Circular Progress View") {
                    CircularProgressView()
                }
            }
            .navigationTitle("Swifty Stuff")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
