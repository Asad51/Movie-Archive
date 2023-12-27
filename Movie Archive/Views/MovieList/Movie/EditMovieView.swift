//
//  EditMovieView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 26/12/23.
//

import SwiftUI

struct EditMovieView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""
    @State private var year: Date = .init(from: "2023")
    @State private var language: String = Language.english.rawValue
    @State private var genre: String = Genre.action.rawValue
    @State private var imdbRating: Double = 0
    @State private var overview: String = ""

    let movie: Movie

    var body: some View {
        VStack(alignment: .leading) {
            GroupBox {
                LabeledContent {
                    TextField("", text: $title)
                } label: {
                    Text("Title")
                }

                LabeledContent {
                    Picker("Language", selection: $language) {
                        ForEach(Language.allCases, id: \.rawValue) { language in
                            Text(language.rawValue)
                                .tag(language)
                        }
                    }
                } label: {
                    Text("Language")
                }
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.gray.opacity(0.1))
                )

                LabeledContent {
                    Picker("Genre", selection: $genre) {
                        ForEach(Genre.allCases, id: \.rawValue) { genre in
                            Text(genre.rawValue)
                                .tag(genre)
                        }
                    }
                } label: {
                    Text("Genre")
                }
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.gray.opacity(0.1))
                )

                LabeledContent {
                    Picker("Year", selection: $year) {
                        ForEach(1900 ..< 2024) { year in
                            let date = Date(from: "\(year)")
                            Text(date, format: .dateTime.year())
                                .tag(date)
                        }
                    }
                } label: {
                    Text("Year")
                }
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.gray.opacity(0.1))
                )

                VStack(alignment: .leading) {
                    Text("IMDB Rating :")
                        .padding(.leading)
                    RatingSlider(rating: $imdbRating)
                }
            }

            Text("Overview")
                .foregroundStyle(.secondary)
            TextEditor(text: $overview)
                .padding(5)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.tertiary, lineWidth: 2)
                }
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Update") {
                movie.title = title
                movie.year = year
                movie.imdbRating = imdbRating
                movie.language = language
                movie.genre = genre
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .onAppear {
            title = movie.title
            year = movie.year
            language = movie.language
            genre = movie.genre
            imdbRating = movie.imdbRating
        }
    }
}

#Preview {
    let previewContainer = PreviewContainer(Movie.self)
    return NavigationStack {
        EditMovieView(movie: Movie.previewMovies[0])
            .modelContainer(previewContainer.container)
    }
}
