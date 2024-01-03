//
//  MovieListView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 3/1/24.
//

import SwiftUI

struct MovieListView: View {
    var movies: [Movie]

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
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Movie List")
                    .font(.title)
            }
        }
    }
}

#Preview {
    let previewController = PreviewController(Movie.self)
    previewController.addPreviewItems(Movie.previewMovies)

    return NavigationStack {
        MovieListView(movies: Movie.previewMovies)
    }
    .modelContainer(previewController.container)
}
