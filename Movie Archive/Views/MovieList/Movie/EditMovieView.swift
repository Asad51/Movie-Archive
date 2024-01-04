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
    @State private var director: String = ""
    @State private var year: Date = .init(from: "2023")
    @State private var language: String = Language.english.rawValue
    @State private var genres: Set<String> = []
    @State private var imdbRating: Double = 0
    @State private var overview: String = ""

    @State private var setInitialValue: Bool = true

    let movie: Movie

    var body: some View {
        VStack(alignment: .leading) {
            GroupBox {
                LabeledContent("Title") {
                    TextField("", text: $title)
                        .textFieldStyle(.roundedBorder)
                }

                LabeledContent("Director") {
                    TextField("", text: $director)
                        .textFieldStyle(.roundedBorder)
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

                NavigationLink {
                    GenrePicker(genres: $genres)
                } label: {
                    HStack {
                        Text("Select Genres: ")

                        Spacer()

                        if genres.count > 0 {
                            Text("\(genres.count)")
                        }
                        Image(systemName: "chevron.right")
                            .padding(.trailing)
                    }
                }
                .foregroundStyle(.primary)
                .padding(10)
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
                movie.director = director
                movie.year = year
                movie.imdbRating = imdbRating
                movie.language = language
                movie.genres = genres
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .onAppear {
            if setInitialValue {
                title = movie.title
                director = movie.director
                year = movie.year
                language = movie.language
                genres = movie.genres
                imdbRating = movie.imdbRating
                setInitialValue = false
            }
        }
    }
}

#Preview {
    SwiftDataPreview(previewContainer: PreviewContainer([Movie.self])) {
        EditMovieView(movie: Movie.previewMovies[0])
    }
}
