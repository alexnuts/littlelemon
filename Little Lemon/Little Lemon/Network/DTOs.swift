//
//  DTOs.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 29.11.2025.
//

import Foundation

struct MenuList: Codable {
    let menu: [MenuItem]
}

struct MenuItem: Codable, Identifiable {
    var id: Int
    let title: String
    let price: String
    let description: String
    let image: String
    let category: String?
}
