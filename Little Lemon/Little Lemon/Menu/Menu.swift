//
//  Menu.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 26.11.2025.
//

import CoreData
import SwiftUI

struct Menu: View {

    @Environment(\.managedObjectContext) private var viewContext

    @ObservedObject var model = MenuModel()

    @State private var searchText = ""

    var body: some View {
        VStack {
            Text("Little Lemon Menu")
                .font(.title)
                .padding()

            TextField("Search menu", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            FetchedObjects(
                predicate: buildPredicate(),
                sortDescriptors: buildSortDescriptors(),
            ) { (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        NavigationLink(destination: DishDetails(dish: dish)) {
                            HStack {
                                VStack(
                                    alignment: .leading
                                ) {
                                    Text(dish.title ?? "")
                                        .font(.title)

                                    let priceStr =
                                        dish.price > 0.0
                                        ? String(format: "%.2f", dish.price)
                                        : "-"
                                    Text("$\(priceStr)")
                                }

                                Spacer()

                                let imgUrl = URL(string: dish.image ?? "")
                                AsyncImage(url: imgUrl) {
                                    image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                                .cornerRadius(8.0)
                            }
                        }
                    }
                }
            }
        }.task {
            await model.reload(viewContext)
        }
    }

    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(
                key: "title",
                ascending: true,
                selector: #selector(NSString.localizedStandardCompare)
            )
        ]
    }

    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
}

#Preview {
    Menu()
}
