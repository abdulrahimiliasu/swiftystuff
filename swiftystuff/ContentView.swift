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
                NavigationLink("Long Press Button View") {
                    LongPressButtonView()
                }
                NavigationLink("Image Variable Blur View") {
                    ImageVariableBlurView(imageName: "silo", blurRadius: 20, position: .bottom)
                }
                NavigationLink("Mesh Gradient Button") {
                    if #available(iOS 18.0, *) {
                        MeshGradientButtonView()
                    } else {
                        Text("This view is only available in iOS 18 and newer")
                    }
                }
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
