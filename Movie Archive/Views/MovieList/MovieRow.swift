//
//  MovieRow.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 25/12/23.
//

import SwiftUI
import SwiftData

struct MovieRow: View {
    var movie: Movie

    var body: some View {
        VStack(alignment: .leading) {
            Image("sample_image")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(alignment: .bottom) {
                    HStack {
                        Circle()
                            .frame(width: 50)
                            .overlay {
                                Text(String(format: "%.1f", movie.imdbRating))
                                    .foregroundStyle(.white)
                            }
                            .overlay(
                                Circle()
                                    .inset(by: 3)
                                    .stroke(.gray, lineWidth: 3.0)
                            )
                            .overlay {
                                Circle()
                                    .inset(by: 3)
                                    .trim(from: 0.0, to: movie.imdbRating * 0.1).rotation(.degrees(-90))
                                    .stroke(.blue, lineWidth: 3.0)
                            }
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

#Preview {
    let previewContainer = PreviewContainer(Movie.self)

    return MovieRow(movie: Movie.previewMovies[0])
        .frame(width: 200, height: 400)
        .background(Color.gray.opacity(0.1))
        .modelContainer(previewContainer.container)
}
