//
//  Note+CoreDataProperties.swift
//  NotesOnCD
//
//  Created by Леонид on 19.06.2021.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var noteName: String?
    @NSManaged public var dateOfCreation: Date?
    @NSManaged public var note: String?

}

extension Note : Identifiable {

}
