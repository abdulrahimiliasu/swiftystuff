//
//  LowerIndicatorsView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 18/08/2024.
//

import SwiftUI

func getIndicatorHeight(idx: Int, heightDifference: CGFloat = 5.0) -> CGFloat {
    switch idx {
    case 0:
        return heightDifference * 2
    case 5:
        return heightDifference * 3
    default:
        return heightDifference
    }
}

struct LowerIndicatorsView: View {
    var body: some View {
        HStack(spacing: 5) {
            ForEach(0 ..< 10, id: \.self) { idx in
                RoundedRectangle(cornerRadius: 10.0)
                    .frame(width: 2, height: getIndicatorHeight(idx: idx))
                    .foregroundStyle(idx == 5 ? .orange : .gray)
            }
        }
    }
}

#Preview {
    LowerIndicatorsView()
}
