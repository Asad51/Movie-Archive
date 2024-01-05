//
//  MovieCategories.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 2/1/24.
//

import SwiftData
import SwiftUI

struct MovieCategories: View {
    @Query(sort: \Movie.title) private var movies: [Movie]

    let sections: [(headerText: String, sortBy: SortOrder)] = [
        (headerText: "Top Rated", sortBy: .rating),
        (headerText: "Latest", sortBy: .year)
    ]

    var body: some View {
        List {
            ForEach(sections, id: \.headerText) { headerText, sortBy in
                Section {
                    HorizontalMovieList(sortBy: sortBy)
                } header: {
                    HStack {
                        Text(headerText)
                            .font(.headline)

                        Spacer()

                        Button {} label: {
                            Text("View All")
                        }
                    }
                }
            }
        }
        .listStyle(.grouped)
    }
}

#Preview {
    SwiftDataPreview(previewContainer: PreviewContainer([Movie.self]), items: Movie.previewMovies) {
        MovieCategories()
    }
}
