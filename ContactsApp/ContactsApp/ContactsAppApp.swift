//
//  ContactsAppApp.swift
//  ContactsApp
//
//  Created by harsh Khandelwal on 18/07/21.
//

import SwiftUI

@main
struct ContactsAppApp: App {
    @StateObject private var modelData = ModelData()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
             .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
