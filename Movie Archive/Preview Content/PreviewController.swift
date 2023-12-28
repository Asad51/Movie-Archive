//
//  PreviewController.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 28/12/23.
//

import SwiftData

struct PreviewController {
    let container: ModelContainer

    init(_ models: any PersistentModel.Type...) {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let schema = Schema(models)

        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Couldn't configure model container.")
        }
    }

    func addPreviewItems(_ items: [any PersistentModel]) {
        Task { @MainActor in
            items.forEach { item in
                container.mainContext.insert(item)
            }
        }
    }
}
