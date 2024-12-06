//
//  ApplySWUIApp.swift
//  ApplySWUI
//
//  Created by Jose Preatorian on 04-12-24.
//

import SwiftUI

@main
struct ApplySWUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            //ContentView()
            HitsContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
