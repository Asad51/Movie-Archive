//
//  MovieList.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 25/12/23.
//

import SwiftUI

struct MovieList: View {
    var movies: [Movie]

    var body: some View {
        List {
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(movies) { movie in
                        MovieRow(movie: movie)
                            .frame(maxWidth: 150, maxHeight: .infinity)

                    }
                }
            }
            .scrollIndicators(.hidden)
            .listRowInsets(EdgeInsets())
            .listSectionSeparator(.hidden)
        }
        .listStyle(.inset)
    }
}

#Preview {
    let previewContainer = PreviewContainer(Movie.self)
    return MovieList(movies: Movie.previewMovies)
        .modelContainer(previewContainer.container)
}
