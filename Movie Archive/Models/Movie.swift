//
//  Movie.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 25/12/23.
//

import Foundation
import SwiftData

@Model
class Movie {
    var title: String
    var director: Director?
    var year: Date
    var language: String
    var genres: Set<String>
    var imdbRating: Double

    @Attribute(originalName: "myRating")
    var userRating: Int

    var posterUrl: String
    var coverUrl: String
    var trailerUrl: String
    var recommedBy: String
    var status: Int = Status.neverWatched.rawValue // Set default value for newly added required property

    init(title: String, director: Director? = nil, year: Date, language: String, genres: Set<String>, imdbRating: Double, userRating: Int = 0, posterUrl: String = "", coverUrl: String = "", trailerUrl: String = "", recommendBy: String = "", status: Status = .neverWatched) {
        self.title = title
        self.director = director
        self.year = year
        self.language = language
        self.genres = genres
        self.imdbRating = imdbRating
        self.userRating = userRating
        self.posterUrl = posterUrl
        self.coverUrl = coverUrl
        self.trailerUrl = trailerUrl
        self.recommedBy = recommendBy
        self.status = status.rawValue
    }
}

enum Status: Int, CaseIterable {
    case neverWatched = 0
    case watching = 1
    case watched = 2

    var description: String {
        switch self {
            case .neverWatched:
                "Never Watched"
            case .watching:
                "Watching"
            case .watched:
                "Watched"
        }
    }
}
