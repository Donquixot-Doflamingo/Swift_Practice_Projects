//
//  animationOfGraphApp.swift
//  animationOfGraph
//
//  Created by harsh Khandelwal on 26/06/21.
//

import SwiftUI

@main
struct animationOfGraphApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
