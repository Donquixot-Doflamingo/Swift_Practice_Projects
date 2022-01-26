//
//  FlashCard+CoreDataProperties.swift
//  flashcard_app
//
//  Created by harsh Khandelwal on 07/06/21.
//
//

import Foundation
import CoreData


extension FlashCard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FlashCard> {
        return NSFetchRequest<FlashCard>(entityName: "FlashCard")
    }

    @NSManaged public var question: String?
    @NSManaged public var answer: String?

}

extension FlashCard : Identifiable {

}
