//
//  practiseDocumentationOfSwiftUIApp.swift
//  practiseDocumentationOfSwiftUI
//
//  Created by harsh Khandelwal on 22/06/21.
//

import SwiftUI

@main
struct practiseDocumentationOfSwiftUIApp: App {
    @StateObject private var modelData = ModelData()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
