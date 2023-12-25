//
//  PreviewContainer.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 25/12/23.
//

import Foundation
import SwiftData

struct PreviewContainer {
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

    func addPreviewSamples(_ samples: [any PersistentModel]) {
        Task { @MainActor in
            samples.forEach { sample in
                container.mainContext.insert(sample)
            }
        }
    }
}
