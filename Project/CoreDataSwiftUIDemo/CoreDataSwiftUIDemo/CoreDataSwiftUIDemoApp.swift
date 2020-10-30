//
//  CoreDataSwiftUIDemoApp.swift
//  CoreDataSwiftUIDemo
//
//  Created by Ludovic Ollagnier on 30/10/2020.
//

import SwiftUI

@main
struct CoreDataSwiftUIDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
