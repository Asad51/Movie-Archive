//
//  AddMovieView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 25/12/23.
//

import SwiftData
import SwiftUI

struct AddMovieView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @Query(sort: \Director.name) private var directors: [Director]

    @State private var title: String = ""
    @State private var director: Director?
    @State private var year: Date = .init(from: "2023")
    @State private var language: String = Language.english.rawValue
    @State private var genres: Set<String> = []
    @State private var imdbRating: Double = 0.0
    @State private var posterUrl: String = ""
    @State private var coverUrl: String = ""

    @State private var showAddDirectorView: Bool = false

    var body: some View {
        Form {
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

            Picker("Language", selection: $language) {
                ForEach(Language.allCases, id: \.rawValue) { language in
                    Text(language.rawValue)
                        .tag(language)
                }
            }

            NavigationLink {
                GenrePicker(genres: $genres)
            } label: {
                HStack {
                    Text("Select Genres: ")

                    Spacer()

                    if genres.count > 0 {
                        Text("\(genres.count)")
                    }
                }
            }

            Picker("Year", selection: $year) {
                ForEach(1900 ..< 2024) { year in
                    let date = Date(from: "\(year)")
                    Text(date, format: .dateTime.year())
                        .tag(date)
                }
            }

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

            Button("Create") {
                let newMovie = Movie(title: title, director: director, year: year, language: language, genres: genres, imdbRating: imdbRating, posterUrl: posterUrl, coverUrl: coverUrl)
                context.insert(newMovie)

                dismiss()
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .buttonStyle(.borderedProminent)
            .padding(.vertical)
            .disabled(title.isEmpty)
            .navigationTitle("New Movie")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showAddDirectorView.toggle()
                } label: {
                    Text("Add Director")
                }
            }
        }
        .sheet(isPresented: $showAddDirectorView, content: {
            AddDirectorView()
        })
    }
}

#Preview {
    SwiftDataPreview(previewContainer: PreviewContainer([Movie.self, Director.self]), items: Director.previewDirectors) {
        NavigationStack {
            AddMovieView()
        }
    }
}
