//
//  AnimationValues.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 02/06/2024.
//

import SwiftUI

let initialAnimationValues: AnimationValues = .init(from: 0.0, to: 0.0, lineWidth: 0.0)
let startAnimationValues: AnimationValues = .init(from: 0.0, to: 0.4, lineWidth: 15.0)
let finishAnimationValues: AnimationValues = .init(from: 1.0, to: 2.0, lineWidth: 0.01)

struct AnimationValues {
    var from: CGFloat
    var to: CGFloat
    var lineWidth: CGFloat
}

enum AnimationPhase {
    case initial, start, finish

    var values: AnimationValues {
        switch self {
        case .initial:
            return initialAnimationValues
        case .start:
            return startAnimationValues
        case .finish:
            return finishAnimationValues
        }
    }
}
