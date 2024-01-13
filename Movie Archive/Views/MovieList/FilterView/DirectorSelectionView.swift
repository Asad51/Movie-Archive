//
//  DirectorSelectionView.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 13/1/24.
//

import SwiftData
import SwiftUI

struct DirectorSelectionView: View {
    @Query(sort: \Director.name) private var directors: [Director]

    @Binding var filterOption: FilterOption
    @State private var selectedDirector: Director?

    var body: some View {
        Picker("", selection: $selectedDirector) {
            Text("Select director")
                .foregroundStyle(.gray)

            ForEach(directors, id: \.name) { director in
                Text(director.name)
                    .tag(director as? Director)
            }
        }
        .onChange(of: selectedDirector) {
            filterOption = .director(name: selectedDirector?.name ?? "")
        }
        .onAppear {
            filterOption = .director(name: selectedDirector?.name ?? "")
        }
    }
}

#Preview {
    SwiftDataPreview(previewContainer: PreviewContainer([Director.self]), items: Director.previewDirectors) {
        DirectorSelectionView(filterOption: .constant(.director(name: "")))
    }
}
