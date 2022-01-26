//
//  ContentView.swift
//  practiseDocumentationOfSwiftUI
//
//  Created by harsh Khandelwal on 22/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        LandmarkList()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
