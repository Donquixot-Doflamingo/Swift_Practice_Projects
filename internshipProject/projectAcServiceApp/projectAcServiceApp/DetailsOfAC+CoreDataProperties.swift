//
//  DetailsOfAC+CoreDataProperties.swift
//  
//
//  Created by harsh Khandelwal on 17/06/21.
//
//

import Foundation
import CoreData


extension DetailsOfAC {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DetailsOfAC> {
        return NSFetchRequest<DetailsOfAC>(entityName: "DetailsOfAC")
    }

    @NSManaged public var serialnumber: String?
    @NSManaged public var modelnumber: String?
    @NSManaged public var actype: String?
    @NSManaged public var purchaseddate: String?
    @NSManaged public var purchasedfrom: String?
    @NSManaged public var installedplace: String?

}
