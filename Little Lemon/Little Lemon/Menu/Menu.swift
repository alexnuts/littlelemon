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

    @State private var displaySearch = false

    var body: some View {
        VStack {
            AppHeader(displayProfilePic: true, displayBackBtn: false)
                .frame(maxWidth: .infinity)
                .frame(height: 56.0)

            FetchedObjects(
                predicate: buildPredicate(),
                sortDescriptors: buildSortDescriptors(),
            ) { (dishes: [Dish]) in
                List {

                    HeroView(onSearch: {
                        self.displaySearch = !self.displaySearch
                    })
                    .listRowInsets(EdgeInsets())

                    if displaySearch {
                        TextField("Search menu", text: $searchText)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                    }

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
                .frame(maxWidth: .infinity)
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
        }
        .navigationBarHidden(true)
        .task {
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
