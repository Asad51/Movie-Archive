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
            Movie(title: "The Shawshank Redemption", year: Date(from: "1994"), language: "English", genres: ["Drama"], imdbRating: 9.3, posterUrl: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", coverUrl: "https://www.themoviedb.org/t/p/w1920_and_h800_multi_faces/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg"),
            Movie(title: "The Godfather", year: Date(from: "1972"), language: "English", genres: ["Crime", "Drama"], imdbRating: 9.2, posterUrl: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/3bhkrj58Vtu7enYsRolD1fZdja1.jpg", coverUrl: "https://www.themoviedb.org/t/p/w1920_and_h800_multi_faces/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg"),
            Movie(title: "The Dark Knight", year: Date(from: "2008"), language: "English", genres: ["Action", "Crime", "Drama", "Thriller"], imdbRating: 9.0, posterUrl: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qJ2tW6WMUDux911r6m7haRef0WH.jpg", coverUrl: "https://www.themoviedb.org/t/p/w1920_and_h800_multi_faces/nMKdUUepR0i5zn0y1T4CsSB5chy.jpg"),
            Movie(title: "The Godfather Part II", year: Date(from: "1974"), language: "English", genres: ["Crime", "Drama"], imdbRating: 9.0, posterUrl: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg", coverUrl: "https://www.themoviedb.org/t/p/w1920_and_h800_multi_faces/kGzFbGhp99zva6oZODW5atUtnqi.jpg"),
            Movie(title: "12 Angry Men", year: Date(from: "1957"), language: "English", genres: ["Crime", "Drama"], imdbRating: 9.0, posterUrl: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ow3wq89wM8qd5X7hWKxiRfsFf9C.jpg", coverUrl: "https://www.themoviedb.org/t/p/w1920_and_h800_multi_faces/qqHQsStV6exghCM7zbObuYBiYxw.jpg"),
            Movie(title: "Aquaman and the Lost Kingdom", year: Date(from: "2023"), language: "English", genres: ["Action", "Adventure", "Fantasy", "Sci-Fi"], imdbRating: 6.0, posterUrl: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qJiWKzdRScI5OcRQqOu3qdMZKXY.jpg", coverUrl: "https://www.themoviedb.org/t/p/w1920_and_h800_multi_faces/jXJxMcVoEuXzym3vFnjqDW4ifo6.jpg"),
            Movie(title: "Home Alone 3", year: Date(from: "1997"), language: "English", genres: ["Action", "Comedy", "Crime", "Family"], imdbRating: 4.6, posterUrl: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/9FKQ7sHImdWSjaBne8Rn1O8jASq.jpg", coverUrl: "https://www.themoviedb.org/t/p/w1920_and_h800_multi_faces/zG8CP8iRhLo7BNBsma6GfP6gkRF.jpg"),
        ]
    }
}
