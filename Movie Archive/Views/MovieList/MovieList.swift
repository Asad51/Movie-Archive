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

    init(searchText: String, sortOption: SortOption, filterOption: FilterOption = .none) {
        var predicate = #Predicate<Movie> {
            searchText.isEmpty == true ||
                $0.title.localizedStandardContains(searchText) == true
        }

        // MARK: - Predicates

        switch filterOption {
            case let .language(language):
                predicate = #Predicate {
                    $0.language.localizedStandardContains(language) && (
                        searchText.isEmpty ||
                            $0.title.localizedStandardContains(searchText))
                }
            case let .year(year):
                predicate = #Predicate {
                    $0.year == year && (
                        searchText.isEmpty ||
                            $0.title.localizedStandardContains(searchText))
                }
            case let .genre(genre):
                // FIXME: - Crashes
//                predicate = #Predicate {
//                    $0.genres.contains(genre) &&
//                        searchText.isEmpty ||
//                        $0.title.localizedStandardContains(searchText)
//                }
                break
            case let .rating(rating):
                predicate = #Predicate {
                    $0.imdbRating >= rating && (
                        searchText.isEmpty ||
                            $0.title.localizedStandardContains(searchText))
                }
            case let .status(status):
                // FIXME: - Crashes
//                predicate = #Predicate {
//                    $0.status == status.rawValue &&
//                        searchText.isEmpty ||
//                        $0.title.localizedStandardContains(searchText)
//                }
                break
            default:
                break
        }

        // MARK: - Sort descriptors

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

        let fetchDescriptor = FetchDescriptor<Movie>(
            predicate: predicate,
            sortBy: sortDescriptors
        )

        _movies = Query(fetchDescriptor)
    }

    var body: some View {
        if movies.count == 0 {
            ContentUnavailableView.search
        } else {
            // MARK: - Movie list

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
