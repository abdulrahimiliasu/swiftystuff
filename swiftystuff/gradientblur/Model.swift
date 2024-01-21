//
//  Model.swift
//  swiftystuff
//
//  Created by Abdulrahim Illo on 21/01/2024.
//

import Foundation

struct Movie: Identifiable {
    let id = UUID()
    let genre: String
    let streamingOn: String
    let date: String
    let image: String
    let details: String
}

let movies: [Movie] = [
    Movie(
        genre: "Sci-Fi. 30 Jun 2023. 43 min",
        streamingOn: "Apple TV+",
        date: "2023. 1 Season (8.4)",
        image: "silo",
        details: "In a ruined and toxic future, thousands live in a giant silo deep underground. After its sheriff breaks a cardinal rule and residents die mysteriously, engineer Juliette starts to uncover shocking secrets and the truth about the silo."
    ),
    Movie(genre: "Comedy, Drama. 30 Mar 2023. 47 min",
          streamingOn: "HBO Max",
          date: "2023. 4 Season (8.9)",
          image: "succession",
          details: "The Roy family is known for controlling the biggest media and entertainment company in the world. However, their world changes when their father steps down from the company.."),
    Movie(genre: "History, Drama. 30 Jun 2019. 47 min",
          streamingOn: "HBO Max",
          date: "2019. 1 Mini Season (9.3)",
          image: "chernobyl",
          details: "In April 1986, an explosion at the Chernobyl nuclear power plant in the Union of Soviet Socialist Republics becomes one of the world's worst man-made catastrophes."),
]
