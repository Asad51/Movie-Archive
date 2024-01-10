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
        let schema = Schema([Movie.self, Director.self])
        let config = ModelConfiguration("Movies", schema: schema)

        do {
            container = try ModelContainer(for: Movie.self, Director.self, configurations: config)
        } catch {
            fatalError("Could not configure the model container.")
        }

        changeNavbarAppearence()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }

    private func changeNavbarAppearence() {
        let appearence = UINavigationBarAppearance()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 24)
        ]

        appearence.titleTextAttributes = attributes
        appearence.largeTitleTextAttributes = attributes
        appearence.backgroundColor = .secondarySystemBackground

        UINavigationBar.appearance().standardAppearance = appearence
        UINavigationBar.appearance().compactAppearance = appearence
        UINavigationBar.appearance().scrollEdgeAppearance = appearence
    }
}
