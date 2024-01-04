//
//  MovieListView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 3/1/24.
//

import SwiftData
import SwiftUI

struct MovieListView: View {
    @State private var searchText: String = ""

    @FocusState private var searchFieldFocused: Bool

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .foregroundStyle(.gray)

                        TextField("Enter movie title", text: $searchText)
                            .focused($searchFieldFocused)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)

                        if !searchText.isEmpty {
                            Image(systemName: "multiply")
                                .onTapGesture {
                                    searchText = ""
                                }
                        }
                    }
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(.gray)
                    }
                    .animation(.easeInOut, value: searchText)

                    if searchFieldFocused {
                        Button("Cancel", role: .cancel) {
                            searchFieldFocused.toggle()
                        }
                    }
                }
                .animation(.easeIn, value: searchFieldFocused)
            }
            .padding(.horizontal)

            MovieList(searchText: searchText)

            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Movie List")
                    .font(.title)
            }
        }
    }
}

#Preview {
    SwiftDataPreview(previewContainer: PreviewContainer([Movie.self]), items: Movie.previewMovies) {
        NavigationStack {
            MovieListView()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
