//
//  CoreDataTransformableExampleApp.swift
//  CoreDataTransformableExample
//
//  Created by Zaid Neurothrone on 2022-09-14.
//

import SwiftUI

@main
struct CoreDataTransformableExampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
