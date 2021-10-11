//
//  KaffeineApp.swift
//  Kaffeine
//
//  Created by Giulia on 11/10/21.
//

import SwiftUI

@main
struct KaffeineApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
