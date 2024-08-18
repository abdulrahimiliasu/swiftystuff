//
//  HorizontalSlider.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 03/08/2024.
//

import SwiftUI

struct HorizontalSlider: View {
    @State private var scrollPosition: Int? = 12
    @State private var sliderValue = 12

    var body: some View {
        VStack {
            Text(String(sliderValue))
                .font(.system(size: 120, weight: .bold, design: .rounded))
                .contentTransition(.numericText())
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 5) {
                    ForEach(10 ..< 50, id: \.self) { idx in
                        SliderIndicator(index: idx)
                            .visualEffect { content, proxy in
                                let frame = proxy.frame(in: .scrollView(axis: .horizontal))
                                let distance = max(0, frame.midX)
                                return content
                                    .opacity(distance < 200 ? 1 : 0.4)
                            }
                            .id(idx)
                    }
                }
                .scrollTargetLayout()
            }
            .frame(height: 100)
            .overlay { TargetIndicatorView() }
            .background { SliderBackgroundView() }
            .scrollPosition(id: $scrollPosition, anchor: .center)
            .onChange(of: scrollPosition ?? 25) { _, newValue in
                withAnimation { sliderValue = newValue }
            }
        }
    }
}

#Preview {
    HorizontalSlider()
}
