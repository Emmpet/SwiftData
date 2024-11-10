//
//  SwiftUppg4App.swift
//  SwiftUppg4
//
//  Created by Emmelie Elisabeth Gabriella Petersson on 2024-11-10.
//

import SwiftUI
import SwiftData

@main
struct SwiftUppg4App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self, ToDo.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
