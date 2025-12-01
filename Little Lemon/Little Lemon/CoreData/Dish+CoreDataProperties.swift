//
//  Dish+CoreDataProperties.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 29.11.2025.
//
//

public import Foundation
public import CoreData


public typealias DishCoreDataPropertiesSet = NSSet

extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var title: String?
    @NSManaged public var price: Float
    @NSManaged public var desc: String?
    @NSManaged public var image: String?

}

extension Dish : Identifiable {
    
}
