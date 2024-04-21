//
//  AlertModalView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 20/04/2024.
//

import SwiftUI

struct ShowModalView: View {
    @EnvironmentObject var alertModal: AlertManager

    var body: some View {
        HStack {
            Button { alertModal.showAlert(.success) } label: { Text("Success") }.tint(.green)
            Button { alertModal.showAlert(.error) } label: { Text("Error") }.tint(.red)
            Button { alertModal.showAlert(.warning) } label: { Text("Warning") }.tint(.orange)
            Button { alertModal.showAlert(.info) } label: { Text("Info") }.tint(.blue)
        }
        .buttonStyle(.bordered)
        .padding()
        .withAlertModal(isPresented: $alertModal.isModalPresented)
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
        .environmentObject(AlertManager())
}
