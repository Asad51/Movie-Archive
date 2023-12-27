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
            Movie(title: "The Shawshank Redemption", director: "Frank Darabont", year: Date(from: "1994"), language: "English", genres: ["Drama"], imdbRating: 9.3),
            Movie(title: "The Godfather", director: "Francis Ford Coppola", year: Date(from: "1972"), language: "English", genres: ["Crime", "Drama"], imdbRating: 9.2),
            Movie(title: "The Dark Knight", director: "Christopher Nolan", year: Date(from: "2008"), language: "English", genres: ["Action", "Crime", "Drama", "Thriller"], imdbRating: 9.0),
            Movie(title: "The Godfather Part II", director: "Francis Ford Coppola", year: Date(from: "1974"), language: "English", genres: ["Crime", "Drama"], imdbRating: 9.0),
            Movie(title: "12 Angry Men", director: "Sidney Lumet", year: Date(from: "1957"), language: "English", genres: ["Crime", "Drama"], imdbRating: 9.0),
            Movie(title: "Aquaman and the Lost Kingdom", director: "James Wan", year: Date(from: "2023"), language: "English", genres: ["Action", "Adventure", "Fantasy", "Sci-Fi"], imdbRating: 6.0),
            Movie(title: "Home Alone 3", director: "Raja Gosnell", year: Date(from: "1997"), language: "English", genres: ["Action", "Comedy", "Crime", "Family"], imdbRating: 4.6)
        ]
    }
}
