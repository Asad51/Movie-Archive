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
    var year: Date
    var language: String
    var genre: String
    var imdbRating: Double
    var myRating: Int

    init(title: String, year: Date, language: String, genre: String, imdbRating: Double, myRating: Int = 0) {
        self.title = title
        self.year = year
        self.language = language
        self.genre = genre
        self.imdbRating = imdbRating
        self.myRating = myRating
    }
}
