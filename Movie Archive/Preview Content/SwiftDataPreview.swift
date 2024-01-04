//
//  SwiftDataPreview.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 4/1/24.
//

import SwiftData
import SwiftUI

struct SwiftDataPreview<Content: View>: View {
    private let content: Content
    private let previewContainer: PreviewContainer
    private let items: [any PersistentModel]?

    init(
        previewContainer: PreviewContainer,
        items: [any PersistentModel]? = nil,
        @ViewBuilder _ content: () -> Content)
    {
        self.previewContainer = previewContainer
        self.items = items
        self.content = content()
    }

    var body: some View {
        content
            .modelContainer(previewContainer.modelContainer)
            .onAppear {
                if let items {
                    previewContainer.add(items: items)
                }
            }
    }
}
