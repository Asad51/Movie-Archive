//
//  ContentView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 25/12/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query(sort: \Movie.title) private var movies: [Movie]

    @State private var addNewMovie: Bool = false

    var body: some View {
        NavigationStack {
            MovieList(movies: movies)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {} label: {
                            Image(systemName: "line.3.horizontal")
                                .imageScale(.large)
                                .foregroundStyle(.black)
                        }
                    }

                    ToolbarItem(placement: .principal) {
                        Text("Movie Archive")
                            .font(.title)
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            addNewMovie.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .imageScale(.large)
                        }
                    }
                }
                .navigationDestination(isPresented: $addNewMovie) {
                    AddMovieView()
                }
        }
    }
}

#Preview {
    let previewContainer = PreviewContainer(Movie.self)
    previewContainer.addPreviewSamples(Movie.previewMovies)

    return ContentView()
        .modelContainer(previewContainer.container)
}
