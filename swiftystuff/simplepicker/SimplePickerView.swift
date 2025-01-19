//
//  SimplePickerView.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 2025. 01. 16..
//

import SwiftUI

private struct PickerModalView: View {
    @Binding var isShowModal: Bool
    @State private var selected: [String] = []

    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                Text("Select tags")
                    .font(.title3)
                    .bold()
                Spacer()
                Text("Recently used")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        PickerButton(title: "Inspiration", selected: $selected)
                        PickerButton(title: "Imporatant", selected: $selected)
                        PickerButton(title: "Later", selected: $selected)
                    }
                    HStack {
                        PickerButton(title: "Gym", selected: $selected)
                        PickerButton(title: "Idea", selected: $selected)
                        PickerButton(title: "Work", selected: $selected)
                        PickerButton(title: "Job", selected: $selected)
                    }
                }
                Spacer()
                PrimaryButton(title: "Done", bgColor: .primary) {
                    isShowModal.toggle()
                }
            }
            .padding(25)
            .frame(width: proxy.size.width)
        }
    }
}

struct SimplePickerView: View {
    @State private var isShowPicker = false

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(sampleContents) { content in TextContentView(content: content) }
                }
                .padding()
            }
            PrimaryButton(title: "Add Tags", bgColor: .purple) { isShowPicker.toggle() }
                .padding()
        }
        .sheet(isPresented: $isShowPicker) {
            PickerModalView(isShowModal: $isShowPicker)
                .presentationBackground(.linearGradient(colors: [Color.clear, .purple.opacity(0.5)], startPoint: .top, endPoint: .bottom))
                .presentationDetents([.height(300)])
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
                .clipShape(.rect(cornerRadius: 30.0))
                .padding()
        }
    }
}

#Preview {
    SimplePickerView()
}
