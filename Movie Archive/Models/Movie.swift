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
    var myRating: Int
    var posterUrl: String
    var coverUrl: String
    var trailerUrl: String
    var recommedBy: String
    var status: Status.RawValue = Status.neverWatched.rawValue // Set default value for newly added required property

    init(title: String, director: Director? = nil, year: Date, language: String, genres: Set<String>, imdbRating: Double, myRating: Int = 0, posterUrl: String = "", coverUrl: String = "", trailerUrl: String = "", recommendBy: String = "", status: Status = .neverWatched) {
        self.title = title
        self.director = director
        self.year = year
        self.language = language
        self.genres = genres
        self.imdbRating = imdbRating
        self.myRating = myRating
        self.posterUrl = posterUrl
        self.coverUrl = coverUrl
        self.trailerUrl = trailerUrl
        self.recommedBy = recommendBy
        self.status = status.rawValue
    }
}

enum Status: Int, CaseIterable {
    case neverWatched = 0
    case watching
    case watched

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
