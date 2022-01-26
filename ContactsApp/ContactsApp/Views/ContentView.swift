//
//  ContentView.swift
//  ContactsApp
//
//  Created by harsh Khandelwal on 18/07/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
  
    @State private var selection: Tab = .contacts
    
    enum Tab {
           case contacts
           case dialer
       }
    
    var body: some View {
        TabView(selection: $selection) {
                    dialer()
            .tabItem {
                Label("dialer", systemImage: "phone")
                    }
                .tag(Tab.dialer)

            ContactList()
            .tabItem {
                Label("contacts", systemImage: "person")
                    }
                .tag(Tab.contacts)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
