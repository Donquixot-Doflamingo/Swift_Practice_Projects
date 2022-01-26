//
//  ContactsRow.swift
//  ContactsApp
//
//  Created by harsh Khandelwal on 18/07/21.
//

import SwiftUI

struct ContactsRow: View {
    
    var contacts : Contacts
    
    var body: some View {
        HStack {
            contacts.image
                       .resizable()
                       .frame(width: 50, height: 50)
            Text(contacts.name)

                   Spacer()
            
            if contacts.isFavorite {
                Image(systemName: "star.fill").foregroundColor(.yellow)
                        }
               }
    }
}

struct ContactsRow_Previews: PreviewProvider {
    
    static var contactsData = ModelData().contactsData
    
    static var previews: some View {
        ContactsRow(contacts: contactsData[1]).previewLayout(.fixed(width: 300, height: 70))
    }
}
