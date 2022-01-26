//
//  WatchOSAppApp.swift
//  WatchOSApp WatchKit Extension
//
//  Created by harsh Khandelwal on 02/07/21.
//

import SwiftUI

@main
struct WatchOSAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
