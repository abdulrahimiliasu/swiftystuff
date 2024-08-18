//
//  AlertModalWrapper.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 20/04/2024.
//

import SwiftUI

struct WithAlertModal<Content>: View where Content: View {
    @ViewBuilder var content: () -> Content
    @State private var alertModal: AlertModalType?

    var body: some View {
        ZStack {
            content()
        }
        .sheet(item: $alertModal) { modal in ModalContentView(modal: modal) }
        .environment(\.alertModal, AlertManager(show: { modal in
            alertModal = modal
        }, hide: {
            alertModal = nil
        }))
    }
}
