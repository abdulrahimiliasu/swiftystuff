//
//  AlertModalWrapper.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 20/04/2024.
//

import SwiftUI

struct WithAlertModal<Content>: View where Content: View {
    @ViewBuilder var content: () -> Content
    @StateObject private var observer: AlertManager = .init()

    var body: some View {
        ZStack {
            content()
        }
        .environmentObject(observer)
    }
}

extension View {
    func withAlertModal(isPresented: Binding<Bool>) -> some View {
        sheet(isPresented: isPresented) {
            ModalContentView()
        }
    }
}
