//
//  LittleLemonService.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 29.11.2025.
//

import Foundation

private let urlMenuExercise = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/littleLemonSimpleMenu.json"

private let urlMenu = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"

public class LittleLemonService {
    static func fetchMenuItems() async throws -> [MenuItem] {
        let url = URL(string: urlMenu)!

        let urlSession = URLSession.shared
        do {
            let (data, _) = try await urlSession.data(from: url)
            let fullMenu = try JSONDecoder().decode(MenuList.self, from: data)
            return fullMenu.menu
        } catch {
            print(error.localizedDescription)
        }

        return []
    }
}
