//
//  AlertViewModel.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 20/04/2024.
//

import Combine
import Foundation

@MainActor
class AlertManager: ObservableObject {
    @Published var isModalPresented: Bool = false
    @Published var modal: AlertModal = successAlertModal

    func showAlert(_ type: AlertModalType) {
        modal = getModalByType(type)
        isModalPresented.toggle()
    }

    func showAlert(_ type: AlertModalType, heading: String, subHeading: String = "Be aware, something happened!") {
        let modalProps = getModalByType(type)
        modal = .init(color: modalProps.color, heading: heading, subHeading: subHeading, icon: modalProps.icon)
        isModalPresented.toggle()
    }

    func showAlert(_ modal: AlertModal) {
        self.modal = modal
        isModalPresented.toggle()
    }

    private func getModalByType(_ type: AlertModalType) -> AlertModal {
        switch type {
        case .success:
            return successAlertModal
        case .warning:
            return warningAlertModal
        case .error:
            return errorAlertModal
        case .info:
            return infoAlertModal
        }
    }
}
