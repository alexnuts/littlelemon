//
//  Dish+Extension.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 29.11.2025.
//

import Foundation
import CoreData

extension Dish {

    static func createDishesFrom(
        menuItems: [MenuItem],
        _ context: NSManagedObjectContext
    ) {
        PersistenceController.shared.clear()
        menuItems
            .filter { !exists(name: $0.title, in: context) }
            .forEach { (menuItem) in
                let dish = Dish(context: context)
                dish.title = menuItem.title
                dish.price = Float(menuItem.price) ?? 0.0
                dish.desc = menuItem.description
                dish.image = menuItem.image
            }
        try? context.save()
    }

    private static func exists(
        name: String,
        in context: NSManagedObjectContext
    ) -> Bool {
        let fetchRequest: NSFetchRequest<Dish> = Dish.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title == %@", name)
        return try! context.count(for: fetchRequest) > 0
    }
    
    
}
