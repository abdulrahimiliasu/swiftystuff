//
//  TextContentModel.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 2025. 01. 18..
//

import Foundation

struct TextContentModel: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let iconName: String
}

let sampleContents = [
    TextContentModel(title: "New years resolution", description: """
    Hold a Lorem Ipsum scavenger hunt on your newly-launched website after any updates. Provide cash or prizes to all users who highlight any Lorem Ipsum text your final edits missed. Do the same for missing, misused, or misspelled words. Your web page analytics will skyrocket as these grammatical and stylistic errors disappear, and your opening rates, conversions, and profits will soar.

    Visit each of the Lorem Ipsum generators listed and test them for yourself. Use each to create separate web pages, emails, ads, and social media posts. Keep trying each generator until you feel comfortable using it. When ready, create themes and templates to sell to fellow content creators.
    """, iconName: "balloon.2"),
    TextContentModel(title: "End of the year party", description: """
    Visit each of the Lorem Ipsum generators listed and test them for yourself. Use each to create separate web pages, emails, ads, and social media posts. Keep trying each generator until you feel comfortable using it. When ready, create themes and templates to sell to fellow content creators.
    """, iconName: "figure.socialdance"),
    TextContentModel(title: "Marathon", description: """
    In SwiftUI, if you want a view to fill the available width and height of its container without explicitly specifying those values, you can rely on layout modifiers that adapt to the container's size
    """, iconName: "figure.run")
]