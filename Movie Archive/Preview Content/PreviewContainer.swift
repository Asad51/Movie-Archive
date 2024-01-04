//
//  PreviewContainer.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 4/1/24.
//

import Foundation
import SwiftData

struct PreviewContainer {
    let modelContainer: ModelContainer

    init(_ types: [any PersistentModel.Type], isStoredInMemoryOnly: Bool = true) {
        let schema = Schema(types)
        let config = ModelConfiguration(isStoredInMemoryOnly: isStoredInMemoryOnly)

        do {
            modelContainer = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Couldn't create model container.")
        }
    }

    func add(items: [any PersistentModel]) {
        Task { @MainActor in
            items.forEach { item in
                modelContainer.mainContext.insert(item)
            }
        }
    }
}
