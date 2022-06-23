//
//  Category+CoreDataProperties.swift
//  Todoey
//
//  Created by iOSTeam on 22/06/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "CategoryTodoey")
    }

    @NSManaged public var name: String?
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension Category {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Entity)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Entity)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension Category : Identifiable {

}
