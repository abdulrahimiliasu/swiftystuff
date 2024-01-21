//
//  ProfileView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 21/01/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            VStack {
                Text("SJ")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding()
                    .background(
                        Circle()
                            .fill(.gray.gradient)
                            .shadow(color: .black.opacity(0.1), radius: 10, x: 0.0, y: 10)
                    )
                VStack(alignment: .center) {
                    Text("Steve Jobs")
                        .font(.title3)
                        .bold()
                    Button("View full profile") {}
                        .font(.caption)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
