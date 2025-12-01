//
//  DishDetails.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 01.12.2025.
//

import SwiftUI

struct DishDetails: View {
    let dish: Dish

    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity, minHeight: 300.0)

            VStack(alignment: .leading, spacing: 10) {

                Text(dish.title ?? "Unknown Dish")
                    .font(.title)
                    .fontWeight(.bold)

                let priceStr =
                    dish.price > 0.0
                    ? String(format: "%.2f", dish.price)
                    : "-"
                Text("$\(priceStr)")
                Text("Price: $\(priceStr)")
                    .font(.headline)
                    .foregroundColor(.secondary)

                Text(dish.desc ?? "")
                    .font(.body)
            }
            .padding()

            Spacer()
        }
        .navigationTitle(dish.title ?? "Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    DishDetails()
//}
