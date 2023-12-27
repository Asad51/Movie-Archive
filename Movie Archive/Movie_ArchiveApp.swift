//
//  Movie_ArchiveApp.swift
//  Movie Archive
//
//  Created by Md. Asadul Islam on 25/12/23.
//

import SwiftData
import SwiftUI

@main
struct Movie_ArchiveApp: App {
    let container: ModelContainer

    init() {
        let schema = Schema([Movie.self])
        let config = ModelConfiguration("Movies", schema: schema)

        do {
            container = try ModelContainer(for: Movie.self, configurations: config)
        } catch {
            fatalError("Could not configure the model container.")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
