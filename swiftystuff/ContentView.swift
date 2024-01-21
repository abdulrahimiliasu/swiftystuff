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
                    Text("In progress ...")
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
