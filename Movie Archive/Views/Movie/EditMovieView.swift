//
//  EditMovieView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 26/12/23.
//

import SwiftData
import SwiftUI

struct EditMovieView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @Query(sort: \Director.name) private var directors: [Director]

    @State private var title: String = ""
    @State private var director: Director?
    @State private var year: Date = .init(from: "2023")
    @State private var language: String = Language.english.rawValue
    @State private var genres: Set<String> = []
    @State private var imdbRating: Double = 0
    @State private var posterUrl: String = ""
    @State private var coverUrl: String = ""
    @State private var status: Status = .unknown
    @State private var userRating: Int = 0
    @State private var overview: String = ""

    @State private var setInitialValue: Bool = true

    let movie: Movie

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                GroupBox {
                    LabeledContent("Title") {
                        TextField("", text: $title)
                            .textFieldStyle(.roundedBorder)
                    }

                    LabeledContent("Director") {
                        Picker("", selection: $director) {
                            Text("Select director")
                                .foregroundStyle(.gray)

                            ForEach(directors, id: \.name) { director in
                                Text(director.name)
                                    .tag(director as? Director)
                            }
                        }
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
                        HStack {
                            Text("IMDB Rating:")
                            Stepper("", value: $imdbRating, in: 0.0 ... 10.0, step: 0.1)
                        }

                        RatingSlider(rating: $imdbRating)
                    }

                    LabeledContent("Poster") {
                        TextField("Enter poster image url", text: $posterUrl, axis: .vertical)
                            .textFieldStyle(.roundedBorder)
                    }

                    LabeledContent("Cover") {
                        TextField("Enter cover image url", text: $coverUrl, axis: .vertical)
                            .textFieldStyle(.roundedBorder)
                    }

                    if movie.status != Status.watched.rawValue {
                        LabeledContent("Status") {
                            Picker("Status", selection: $status) {
                                ForEach(Status.allCases, id: \.rawValue) { status in
                                    Text(status.description)
                                        .tag(status)
                                }
                            }
                        }
                    }

                    if status == .watched {
                        LabeledContent("User Rating") {
                            UserRatingView(currentRating: $userRating)
                        }
                    }
                }

                Text("Overview")
                    .foregroundStyle(.secondary)

                TextEditor(text: $overview)
                    .padding(5)
                    .frame(minHeight: 150)
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
                    movie.posterUrl = posterUrl
                    movie.coverUrl = coverUrl
                    movie.status = status.rawValue
                    movie.userRating = userRating
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
                    posterUrl = movie.posterUrl
                    coverUrl = movie.coverUrl
                    status = Status(rawValue: movie.status) ?? .neverWatched
                    userRating = movie.userRating
                    setInitialValue = false
                }
            }
        }
    }
}

#Preview {
    SwiftDataPreview(previewContainer: PreviewContainer([Movie.self, Director.self]), items: Director.previewDirectors) {
        EditMovieView(movie: Movie.previewMovies[0])
    }
}
