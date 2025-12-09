//
//  MenuModel.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 29.11.2025.
//

import Combine
import CoreData
import Foundation

@MainActor
class MenuModel: ObservableObject {

    @Published var menuCategories: [String] = []

    func reload(_ ctx: NSManagedObjectContext) async {
        do {

            let menu = try await LittleLemonService.fetchMenuItems()
            Dish.createDishesFrom(menuItems: menu, ctx)

            var categories : [String] = []
            menu.forEach {
                let c = $0.category ?? ""
                if !c.isEmpty && !categories.contains(c) {
                    categories.append(c)
                }
            }
            
            self.menuCategories = categories.sorted()

        } catch {
            print(error.localizedDescription)
        }
    }

}
