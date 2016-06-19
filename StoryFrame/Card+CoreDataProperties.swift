//
//  Card+CoreDataProperties.swift
//  
//
//  Created by SEBASTIEN MONTIBELLER on 19/06/2016.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Card {

    @NSManaged var cardTitle: String?
    @NSManaged var cardDescription: String?
    @NSManaged var cardImage: NSData?

}
