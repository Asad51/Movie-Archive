//
//  GenreSelectionView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 8/1/24.
//

import SwiftUI

struct GenreSelectionView: View {
    @Binding var filterOption: FilterOption
    @State private var genre: String = Genre.action.rawValue

    var body: some View {
        Picker("Select Genre", selection: $genre) {
            ForEach(Genre.allCases, id: \.rawValue) { genre in
                Text(genre.rawValue)
                    .tag(genre)
            }
        }
        .onChange(of: genre) {
            filterOption = .genre(genre: genre)
        }
        .onAppear {
            filterOption = .genre(genre: genre)
        }
    }
}

#Preview {
    GenreSelectionView(filterOption: .constant(.genre()))
}
