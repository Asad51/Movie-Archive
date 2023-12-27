//
//  GenrePicker.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 27/12/23.
//

import SwiftUI

struct GenrePicker: View {
    @Binding var genres: Set<String>

    var body: some View {
        Form {
            List {
                ForEach(Genre.allCases, id: \.rawValue) { genre in
                    Button {
                        if genres.contains(genre.rawValue) {
                            genres.remove(genre.rawValue)
                        } else {
                            genres.insert(genre.rawValue)
                        }
                    } label: {
                        HStack {
                            Image(systemName: genres.contains(genre.rawValue) ? "checkmark.square" : "square")

                            Text(genre.rawValue)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        GenrePicker(genres: .constant(["Action"]))
    }
}
