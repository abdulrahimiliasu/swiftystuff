//
//  TransparentModalView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 11/05/2024.
//

import SwiftUI

struct TransparentModalView: View {
    @State private var isShowModal = false
    @Namespace private var modalNameSpace

    var body: some View {
        GeometryReader { proxy in
            VStack {
                Button(action: {
                    withAnimation(.smooth) {
                        isShowModal.toggle()
                    }

                }, label: {
                    Label("Show Modal", systemImage: "plus.circle.fill")
                })
                .labelStyle(.iconOnly)
                .font(.title)
            }
            .blur(radius: isShowModal ? 10 : 0)
            .overlay {
                if isShowModal {
                    VStack {
                        ScrollView {
                            LazyVStack {
                                ModalItemsView()
                                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                                    .scrollTransition { content, phase in
                                        content
                                            .scaleEffect(phase.isIdentity ? 1 : 0.5)
                                            .blur(radius: phase.isIdentity ? 0 : 20)
                                    }
                                ModalItemsView()
                                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                                ModalItemsView()
                                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                            }
                            .scrollTargetLayout()
                        }
                        .scrollIndicators(.hidden)
                        .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height)
                }
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}

struct ModalItemsView: View {
    var body: some View {
        VStack {
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
        }
    }
}

#Preview {
    TransparentModalView()
}
