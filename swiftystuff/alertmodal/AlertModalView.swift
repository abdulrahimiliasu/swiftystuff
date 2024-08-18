//
//  AlertModalView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 20/04/2024.
//

import SwiftUI

struct ShowModalView: View {
    @Environment(\.alertModal) var alertModal: AlertManager

    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                HStack {
                    Button { alertModal.show(.success) } label: { Text("Success") }.tint(.green)
                    Button { alertModal.show(.error) } label: { Text("Error") }.tint(.red)
                    Button { alertModal.show(.warning) } label: { Text("Warning") }.tint(.orange)
                    Button { alertModal.show(.info) } label: { Text("Info") }.tint(.blue)
                }
                .buttonStyle(.bordered)

                NavigationLink("Navigate") {
                    Button {
                        alertModal.show(.custom(color: .purple, heading: "Custom", subHeading: "try some custom stuff!", icon: "circle"))
                    } label: { Text("Custom") }.tint(.purple)
                }
            }

            .padding()
        }
    }
}

// @main entry point
struct AlertModalView: View {
    var body: some View {
        WithAlertModal {
            ShowModalView()
        }
    }
}

#Preview {
    AlertModalView()
}
