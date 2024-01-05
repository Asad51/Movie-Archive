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

    init(searchText: String, sortOrder: SortOrder) {
        let sortDescriptors: [SortDescriptor<Movie>] = switch sortOrder {
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
            MovieList(searchText: "", sortOrder: .rating)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
