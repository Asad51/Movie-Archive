//
//  ContentView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 25/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            MovieList(movies: Movie.previewMovies)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {

                        } label: {
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

                        } label: {
                            Image(systemName: "plus")
                                .imageScale(.large)
                        }
                    }
                }
        }
    }
}

#Preview {
    let previewContainer = PreviewContainer(Movie.self)
    return ContentView()
        .modelContainer(previewContainer.container)
}
