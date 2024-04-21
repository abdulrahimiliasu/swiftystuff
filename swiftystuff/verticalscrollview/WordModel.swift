//
//  WordModel.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 20/04/2024.
//

import Foundation
import SwiftUI

struct Word: Identifiable {
    let id = UUID()
    let title: String
    let partOfSpeech: String
    let phonetic: String
}

let words = [
    Word(title: "imminent", partOfSpeech: "adjective", phonetic: "/ˈɪmɪnənt/"),
    Word(title: "altruistic", partOfSpeech: "adjective", phonetic: "/ˌæl.tɹuˈɪs.tɪk/"),
    Word(title: "comeuppance", partOfSpeech: "adjective", phonetic: "/kʌmˈʌpəns/"),
    Word(title: "punctilious", partOfSpeech: "adjective", phonetic: "/pʌŋkˈtɪli.əs/"),
    Word(title: "vespertine", partOfSpeech: "adjective", phonetic: "/ˈvɛspəɹtɪn/"),
    Word(title: "calumnies", partOfSpeech: "adjective", phonetic: "/kˈælʌmniz/")
]
