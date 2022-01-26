//
//  ContactsData.swift
//  ContactsApp
//
//  Created by harsh Khandelwal on 18/07/21.
//

import Foundation
import SwiftUI

struct Contacts: Hashable, Codable, Identifiable{
    
    var id: Int
    var name: String
    var number: String
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
        var image: Image {
            Image(imageName)
        }
}
