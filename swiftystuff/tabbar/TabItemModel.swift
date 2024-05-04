//
//  TabItemModel.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 28/04/2024.
//

import Foundation
import SwiftUI

struct TabItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let systemImage: String
    let color: Color
}
