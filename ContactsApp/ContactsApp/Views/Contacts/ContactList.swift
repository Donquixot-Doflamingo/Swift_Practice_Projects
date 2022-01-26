//
//  ContactList.swift
//  ContactsApp
//
//  Created by harsh Khandelwal on 18/07/21.
//

import SwiftUI

struct ContactList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredContacts: [Contacts] {
        modelData.contactsData.filter { contacts in
                (!showFavoritesOnly || contacts.isFavorite)
            }
        }
    var body: some View {
        
        VStack {
            HStack{
                Button(action: {
                    
                }, label: {
                    Text("Add Contact").font(.system(size: 15)).frame(width: 100, height: 15).background(Color.white).foregroundColor(.black).padding()
                })
            }
            NavigationView {
                List{
                    Toggle(isOn: $showFavoritesOnly) {
                            Text("Favorites only")
                            }
                    
                    ForEach(filteredContacts) { contacts in
                    NavigationLink(destination: ContactDetails(contact: contacts)){
                        ContactsRow(contacts: contacts)
                        }
                    }
                }
                .navigationTitle("Contacts").padding(.bottom, 10)
            }
        }
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
            ContactList().environmentObject(ModelData())
        }
}
