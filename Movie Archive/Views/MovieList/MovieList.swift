//
//  MovieList.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 5/1/24.
//

import SwiftData
import SwiftUI

struct MovieList: View {
    @Query private var movies: [Movie]

    init(searchText: String) {
        _movies = Query(filter: #Predicate {
            searchText.isEmpty ||
                $0.title.localizedStandardContains(searchText)
        })
    }

    var body: some View {
        List {
            ForEach(movies) { movie in
                NavigationLink {
                    MovieDetails(movie: movie)
                } label: {
                    MovieListRow(movie: movie)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.black)
                        .listRowInsets(EdgeInsets())
                        .listSectionSeparator(.hidden)
                }
                .listRowInsets(EdgeInsets())
            }
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    SwiftDataPreview(previewContainer: PreviewContainer([Movie.self]), items: Movie.previewMovies) {
        NavigationStack {
            MovieList(searchText: "")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
