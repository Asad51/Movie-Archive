//
//  ContentView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 25/12/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var addNewMovie: Bool = false

    var body: some View {
        NavigationStack {
            MovieCategories()
                .navigationBarTitleDisplayMode(.inline)
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
    let previewController = PreviewController(Movie.self)
    previewController.addPreviewItems(Movie.previewMovies)

    return ContentView()
        .modelContainer(previewController.container)
}
