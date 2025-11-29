//
//  DishManager.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 29.11.2025.
//

import Foundation

class DishManager {
    static func createDishesFrom(
        menuItems: [MenuItem],
        _ context: NSManagedObjectContext
    ) {
        for menuItem in menuItems {
//            guard exists(name: menuItem.title, context) != nil else {
//                continue
//            }
//            let oneDish = Dish(context: context)
//            oneDish.name = menuItem.title
//            if let price = Float(menuItem.price) {
//                oneDish.price = price
//            }
//            oneDish.description = menuItem.description
//            oneDish.image = menuItem.image
        }
    }
}
