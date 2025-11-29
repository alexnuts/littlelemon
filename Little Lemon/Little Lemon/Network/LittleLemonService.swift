//
//  LittleLemonService.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 29.11.2025.
//

import Foundation

public class LittleLemonService {
    static func fetchMenuItems() async throws -> [MenuItem] {
        let url = URL(
            string:
                "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/littleLemonSimpleMenu.json"
        )!

        let urlSession = URLSession.shared
        do {
            let (data, _) = try await urlSession.data(from: url)
            let fullMenu = try JSONDecoder().decode(JSONMenu.self, from: data)
            return fullMenu.menu
        } catch {
            print(error.localizedDescription)
        }

        return []
    }
}
