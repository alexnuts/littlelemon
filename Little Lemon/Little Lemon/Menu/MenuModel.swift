//
//  MenuModel.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 29.11.2025.
//

import Foundation
import CoreData
import Combine

@MainActor
class MenuModel: ObservableObject {
    
    @Published var menuItems: [MenuItem] = [MenuItem]()

    func reload(_ ctx: NSManagedObjectContext) async {
        do {
            let menu = try await LittleLemonService.fetchMenuItems()
            Dish.createDishesFrom(menuItems: menu, ctx)
            self.menuItems = menu
        } catch {
            print(error.localizedDescription)
        }
    }

}
