//
//  HorizontalMovieRow.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 3/1/24.
//

import SwiftData
import SwiftUI

struct HorizontalMovieRow: View {
    var movie: Movie

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: movie.posterUrl)) { image in
                image
                    .posterModifier(imdbRating: movie.imdbRating, status: movie.status)
            } placeholder: {
                Image("no_image")
                    .posterModifier(imdbRating: movie.imdbRating, status: movie.status)
            }

            Group {
                Text("\(movie.title)")
                    .font(.headline)
                    .lineLimit(4)

                Text("\(movie.year.toString())")
                    .lineLimit(1)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 10)
        }
    }
}

private extension Image {
    func posterModifier(imdbRating: Double, status: Int) -> some View {
        let state = Status(rawValue: status) ?? .unknown
        let showCircle = state == .watched
        
        return self
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 250)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(alignment: .topTrailing) {
                if showCircle {
                    ZStack(alignment: .center) {
                        Circle()
                            .fill(.green)

                        Image(systemName: "checkmark")
                            .foregroundStyle(.black)
                            .bold()
                    }
                    .frame(width: 30)
                    .offset(x: -10, y: 10)
                }
            }
            .overlay(alignment: .bottom) {
                HStack {
                    IMDBRatingCircle(rating: imdbRating, circleWidth: 50)
                        .offset(x: 20)

                    Spacer()

                    Circle()
                        .frame(width: 50)
                        .offset(x: -10)
                        .opacity(0)
                }
                .offset(y: 25)
            }
            .padding(.bottom, 25)
    }
}

#Preview {
    SwiftDataPreview(previewContainer: PreviewContainer([Movie.self])) {
        HorizontalMovieRow(movie: Movie.previewMovies[0])
            .frame(width: 200, height: 400)
            .background(Color.gray.opacity(0.1))
    }
}
