//
//  AlertViewModel.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 20/04/2024.
//

import Combine
import Foundation

typealias ShowAlert = (_ modal: AlertModalType) -> Void
typealias HideAlert = () -> Void

struct AlertManager {
    let show: ShowAlert
    let hide: HideAlert
}
