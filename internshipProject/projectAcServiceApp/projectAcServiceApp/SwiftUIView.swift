//
//  SwiftUIView.swift
//  projectAcServiceApp
//
//  Created by harsh Khandelwal on 17/06/21.
//

import SwiftUI

struct SwiftUIView: View {
    var ac_details = AC_Details()
    var body: some View {
        NavigationView{
            List{
                Text(ac_details.ACType)
                Text(ac_details.serialNumber)
                Text(ac_details.modelNumber)
                Text(ac_details.purchasedDate)
            }
            .navigationTitle("Menu")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
