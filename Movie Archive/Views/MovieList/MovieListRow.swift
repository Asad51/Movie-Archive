//
//  MovieListRow.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 3/1/24.
//

import SwiftUI

struct MovieListRow: View {
    var movie: Movie

    var body: some View {
        HStack(spacing: 10) {
            // MARK: - Poster image

            AsyncImage(url: URL(string: movie.posterUrl)) { image in
                image
                    .posterModifier()
            } placeholder: {
                Image("no_image")
                    .posterModifier()
            }

            // MARK: - Movie info

            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(1)

                Text(movie.director?.name ?? "")
                    .font(.subheadline)

                HStack(spacing: 5) {
                    Text(movie.year.toString())

                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)

                    Text("\(String(format: "%.1f", movie.imdbRating))")
                }
                .font(.caption)

                genreView
            }

            Spacer()
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: - Genre View

    private var genreView: some View {
        let genres = Array(movie.genres)
        let numOfGenresToShow: Int = min(2, genres.count)

        return HStack {
            ForEach(0 ..< numOfGenresToShow, id: \.self) { index in
                GenreCapsule(genre: genres[index])
            }

            if genres.count > numOfGenresToShow {
                Text("+\(genres.count - numOfGenresToShow)")
            }
        }
    }
}

private extension Image {
    // MARK: - Poster image modifier

    /// Modify poster image
    /// - Returns: Returns modified image
    func posterModifier() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 100)
            .frame(maxWidth: 75)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .shadow(radius: 3)
            .padding(5)
    }
}

#Preview {
    VStack {
        MovieListRow(movie: Movie.previewMovies[4])
            .background(Color.gray.opacity(0.1))
        MovieListRow(movie: Movie.previewMovies[6])
            .background(Color.gray.opacity(0.1))
    }
}
