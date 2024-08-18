//
//  Model.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 21/04/2024.
//

import Foundation
import SwiftUI

struct AlertModal: Identifiable {
    let id = UUID()
    let color: Color
    let heading: String
    let subHeading: String
    let icon: String
}

enum AlertModalType: Identifiable, Hashable {
    case success, error, warning, info, custom(color: Color, heading: String, subHeading: String, icon: String)

    var id: Self { self }

    var value: AlertModal {
        switch self {
        case .success:
            return .init(color: .green, heading: "Success", subHeading: "Be aware, something happened!", icon: "checkmark.circle.fill")
        case .error:
            return .init(color: .red, heading: "Error", subHeading: "Be aware, something happened!", icon: "xmark.circle.fill")
        case .warning:
            return .init(color: .orange, heading: "Warning", subHeading: "Be aware, something happened!", icon: "exclamationmark.triangle.fill")
        case .info:
            return .init(color: .blue, heading: "Info", subHeading: "Be aware, something happened!", icon: "info.circle.fill")
        case .custom(color: let color, heading: let heading, subHeading: let subHeading, icon: let icon):
            return .init(color: color, heading: heading, subHeading: subHeading, icon: icon)
        }
    }
}
