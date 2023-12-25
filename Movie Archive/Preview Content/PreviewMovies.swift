//
//  PreviewMovies.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 25/12/23.
//

import Foundation

extension Movie {
    static var previewMovies: [Movie] {
        [
            Movie(title: "The Shawshank Redemption", year: Date.yearOnly(from: "1994"), language: "English", genre: "Drama", imdbRating: 9.3),
            Movie(title: "The Godfather", year: Date.yearOnly(from: "1972"), language: "English", genre: "Crime", imdbRating: 9.2),
            Movie(title: "The Dark Knight", year: Date.yearOnly(from: "2008"), language: "English", genre: "Action", imdbRating: 9.0),
            Movie(title: "The Godfather Part II", year: Date.yearOnly(from: "1974"), language: "English", genre: "Crime", imdbRating: 9.0),
            Movie(title: "12 Angry Men", year: Date.yearOnly(from: "1957"), language: "English", genre: "Crime", imdbRating: 9.0)
        ]
    }
}
