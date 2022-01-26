//
//  ContactDetails.swift
//  ContactsApp
//
//  Created by harsh Khandelwal on 18/07/21.
//

import SwiftUI

struct ContactDetails: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    
    var contact : Contacts
    
    var contactIndex: Int {
            modelData.contactsData.firstIndex(where: { $0.id == contact.id })!
        }
    
    var body: some View {
        ScrollView{
            
            VStack {
             
                EditButton().padding(.leading, 300).font(.headline)
            
            CircleImage(image: contact.image)
                .offset(y: 0)
                .padding(.bottom, 10).padding(.top,20)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(contact.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    FavouriteButton(isSet: $modelData.contactsData[contactIndex].isFavorite)
                }

                HStack {
                    Text("Phone Number")
                    Spacer()
                    Text(contact.number)
                        }
                
                .font(.headline)
                .foregroundColor(.primary)

                Divider()

                Text("About \(contact.name)")
                    .font(.title2).padding(.bottom, 10)
                Text(contact.description)
                }
            .padding()
        }
        .navigationTitle(contact.name)
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContactDetails_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        ContactDetails(contact: ModelData().contactsData[0]).environmentObject(modelData)
    }
}
