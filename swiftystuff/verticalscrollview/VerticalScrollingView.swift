//
//  ViewAlignedScrollView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 20/04/2024.
//

import SwiftUI

struct CustomScrollTargetBehavior: ScrollTargetBehavior {
    func updateTarget(_ target: inout ScrollTarget, context: ViewAlignedScrollTargetBehavior.TargetContext) {
        // customize scroll target behavior
    }
}

struct VerticalScrollingView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(words) { word in
                        ZStack {
                            Color(Color("bgColor"))
                                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                            WordDetailsView(word: word)
                        }
                        .scrollTransition { content, phase in
                            content
                                .scaleEffect(phase.isIdentity ? 1 : 0.5)
                                .blur(radius: phase.isIdentity ? 0 : 20)
                        }
                    }
                }
                .scrollTargetLayout()
            }
        }
        .background(Color("bgColor"))
        .ignoresSafeArea(.all)
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
    }
}

#Preview {
    VerticalScrollingView()
}
