//
//  GenreSelectionView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 8/1/24.
//

import SwiftUI

struct GenreSelectionView: View {
    @Binding var filterOption: FilterOption
    @State private var genre: String = ""

    var body: some View {
        Picker("Select Genre", selection: $genre) {
            Text("Select Genre")
            
            ForEach(Genre.allCases, id: \.rawValue) { genre in
                Text(genre.rawValue)
                    .tag(genre)
            }
        }
        .onChange(of: genre) {
            filterOption = .genre(genre: genre)
        }
        .onAppear {
            if case let .genre(genre) = filterOption {
                self.genre = genre
            }
        }
    }
}

#Preview {
    GenreSelectionView(filterOption: .constant(.genre()))
}
