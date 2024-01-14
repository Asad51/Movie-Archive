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

    @State var sortOption: SortOption
    @State var filterOption: FilterOption

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                // MARK: - Search field

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

                HStack {
                    // MARK: - Filter selection

                    FilterSelectionView(filterOption: $filterOption)

                    Spacer()
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)

            MovieList(searchText: searchText, sortOption: sortOption, filterOption: filterOption)
                .animation(.easeIn, value: searchText)
                .animation(.easeIn, value: sortOption)
                .animation(.easeIn, value: filterOption)

            Spacer()
        }
        .ignoresSafeArea(edges: .bottom)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Movie List")
                    .font(.title)
            }

            ToolbarItem(placement: .topBarTrailing) {
                // MARK: - Sort menu

                Menu {
                    Picker("", selection: $sortOption) {
                        ForEach(SortOption.allCases, id: \.rawValue) { option in
                            Text(option.rawValue)
                                .tag(option)
                        }
                    }
                } label: {
                    HStack {
                        Text(sortOption.rawValue)
                        Image(systemName: "arrow.up.arrow.down")
                            .resizable()
                            .imageScale(.medium)
                    }
                    .bold()
                    .foregroundStyle(.blue)
                }
            }
        }
    }
}

#Preview {
    SwiftDataPreview(previewContainer: PreviewContainer([Movie.self]), items: Movie.previewMovies) {
        NavigationStack {
            MovieListView(sortOption: .rating, filterOption: .none)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
