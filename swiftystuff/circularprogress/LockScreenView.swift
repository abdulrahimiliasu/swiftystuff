//
//  LockScreenView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 02/06/2024.
//

import SwiftUI

struct LockScreenView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 20) {
                Image(systemName: "lock.fill")
                Text("15:43")
                    .font(.system(size: 80, design: .rounded))
                Spacer()
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}

#Preview {
    LockScreenView()
}
