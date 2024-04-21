//
//  Model.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 21/04/2024.
//

import Foundation
import SwiftUI

struct AlertModal {
    let color: Color
    let heading: String
    let subHeading: String
    let icon: String
}

enum AlertModalType {
    case success, error, warning, info
}

let successAlertModal = AlertModal(color: .green, heading: "Success", subHeading: "Be aware, something happened!", icon: "checkmark.circle.fill")
let warningAlertModal = AlertModal(color: .orange, heading: "Warning", subHeading: "Be aware, something happened!", icon: "exclamationmark.triangle.fill")
let errorAlertModal = AlertModal(color: .red, heading: "Error", subHeading: "Be aware, something happened!", icon: "xmark.circle.fill")
let infoAlertModal = AlertModal(color: .blue, heading: "Info", subHeading: "Be aware, something happened!", icon: "info.circle.fill")
