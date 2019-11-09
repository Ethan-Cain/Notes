//
//  Note+CoreDataProperties.swift
//  Notes
//
//  Created by Ethan Cain on 11/8/19.
//  Copyright © 2019 ethancain. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var name: String?
    @NSManaged public var body: String?
    @NSManaged public var rawDate: NSDate?

}
