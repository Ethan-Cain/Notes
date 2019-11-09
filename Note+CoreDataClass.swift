//
//  Note+CoreDataClass.swift
//  Notes
//
//  Created by Ethan Cain on 11/8/19.
//  Copyright © 2019 ethancain. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Note)
public class Note: NSManagedObject {
    var date: Date? {
        get {
            return rawDate as Date?
        }
        set {
            rawDate = newValue as NSDate?
        }
    }
    
    convenience init?(name: String?, body: String?, date: Date?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Note.entity(), insertInto: managedContext)
        
        self.name = name
        self.body = body
        self.date = date
    }
}
