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
                        NavigationLink {
                            MovieDetails(movie: movie)
                        } label: {
                            MovieRow(movie: movie)
                                .frame(maxWidth: 150, maxHeight: .infinity)
                                .foregroundStyle(.black)
                        }
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
    let previewController = PreviewController(Movie.self)
    
    return NavigationStack {
        MovieList(movies: Movie.previewMovies)
            .modelContainer(previewController.container)
    }
}
