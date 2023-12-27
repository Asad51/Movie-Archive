//
//  GenreView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 28/12/23.
//

import SwiftUI

struct GenreView: View {
    let genres: Set<String>

    var body: some View {
        HStack {
            ForEach(genres.sorted(by: <), id: \.self) { genre in
                GenreCapsule(genre: genre)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(5)
        .border(.blue.opacity(0.2), width: 1)
        .background(.cyan.opacity(0.2))
    }
}

#Preview {
    GenreView(genres: ["Action", "crime"])
}
