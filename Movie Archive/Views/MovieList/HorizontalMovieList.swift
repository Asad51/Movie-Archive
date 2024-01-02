//
//  HorizontalMovieList.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 3/1/24.
//

import SwiftData
import SwiftUI

struct HorizontalMovieList: View {
    @Query(sort: \Movie.title) private var movies: [Movie]

    init(sortBy order: SortOrder = .none) {
        let sortDescriptors: [SortDescriptor<Movie>] = switch order {
        case .title:
            [SortDescriptor(\Movie.title)]
        case .year:
            [SortDescriptor(\Movie.year, order: .reverse)]
        case .rating:
            [SortDescriptor(\Movie.imdbRating, order: .reverse)]
        default:
            [SortDescriptor(\Movie.title)]
        }

        _movies = Query(sort: sortDescriptors)
    }

    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top, spacing: 10) {
                ForEach(movies) { movie in
                    NavigationLink {
                        MovieDetails(movie: movie)
                    } label: {
                        HorizontalMovieRow(movie: movie)
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
}

#Preview {
    let previewController = PreviewController(Movie.self)
    previewController.addPreviewItems(Movie.previewMovies)

    return NavigationStack {
        List {
            HorizontalMovieList(sortBy: .year)
        }
        .listStyle(.inset)
    }
    .modelContainer(previewController.container)
}
