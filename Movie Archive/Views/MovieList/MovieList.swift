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

    @State private var selectedMovie: Movie?

    init(searchText: String, sortOption: SortOption) {
        let sortDescriptors: [SortDescriptor<Movie>] = switch sortOption {
            case .title:
                [SortDescriptor(\Movie.title)]
            case .year:
                [SortDescriptor(\Movie.year, order: .reverse)]
            case .rating:
                [SortDescriptor(\Movie.imdbRating, order: .reverse)]
            default:
                []
        }

        _movies = Query(
            filter: #Predicate {
                searchText.isEmpty ||
                    $0.title.localizedStandardContains(searchText)
            },
            sort: sortDescriptors
        )
    }

    var body: some View {
        if movies.count == 0 {
            ContentUnavailableView.search
        } else {
            List {
                ForEach(movies) { movie in
                    MovieListRow(movie: movie)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.black)
                        .listSectionSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0))
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedMovie = movie
                        }
                }
            }
            .navigationDestination(item: $selectedMovie) { movie in
                MovieDetails(movie: movie)
            }
            .listStyle(.insetGrouped)
        }
    }
}

#Preview {
    SwiftDataPreview(previewContainer: PreviewContainer([Movie.self]), items: Movie.previewMovies) {
        NavigationStack {
            MovieList(searchText: "", sortOption: .rating)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
