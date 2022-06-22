//
//  Entity+CoreDataProperties.swift
//  Todoey
//
//  Created by iOSTeam on 21/06/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Item")
    }

    @NSManaged public var taskName: String?
    @NSManaged public var complated: Bool

}

extension Entity : Identifiable {

}
