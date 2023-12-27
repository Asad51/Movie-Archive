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

    @State private var title: String = ""
    @State private var year: Date = .init(from: "2023")
    @State private var language: String = Language.english.rawValue
    @State private var genre: String = Genre.action.rawValue
    @State private var imdbRating: Double = 0.0

    var body: some View {
        NavigationStack {
            Form {
                TextField("Movie title", text: $title)

                Picker("Language", selection: $language) {
                    ForEach(Language.allCases, id: \.rawValue) { language in
                        Text(language.rawValue)
                            .tag(language)
                    }
                }

                Picker("Genre", selection: $genre) {
                    ForEach(Genre.allCases, id: \.rawValue) { genre in
                        Text(genre.rawValue)
                            .tag(genre)
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
                    Text("IMDB Rating:")
                    RatingSlider(rating: $imdbRating)
                }

                Button("Create") {
                    let newMovie = Movie(title: title, year: year, language: language, genre: genre, imdbRating: imdbRating)
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
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
}

#Preview {
    AddMovieView()
}
