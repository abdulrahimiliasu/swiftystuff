//
//  AlertEnvironment.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 17/08/2024.
//

import Foundation
import SwiftUI

struct AlertModalKey: EnvironmentKey {
    static var defaultValue: AlertManager = AlertManager { _ in } hide: {}
}

extension EnvironmentValues {
    var alertModal: AlertManager {
        get { self[AlertModalKey.self] }
        set { self[AlertModalKey.self] = newValue }
    }
}
