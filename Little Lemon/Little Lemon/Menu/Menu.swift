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

    @StateObject var model = MenuModel()

    @State private var searchText = ""

    @State private var displaySearch = false

    @State private var selectedCategory: String = ""

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

                    Text("ORDER FOR DELIVERY!")
                        .padding(.top, 8.0)
                        .padding(.bottom, 4.0)
                        .fontWeight(.semibold)

                    let categories = model.menuCategories

                    if !categories.isEmpty {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(categories, id: \.self) { c in
                                    if c == selectedCategory {
                                        Button(c) {
                                            self.selectedCategory = ""
                                        }.stylePrimarySelectedButton()
                                    } else {
                                        Button(c) {
                                            self.selectedCategory = c
                                        }.stylePrimaryUnselectedButton()
                                    }

                                }
                            }
                        }
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

    func prepareCategoties(_ dishes: [Dish]) -> [String] {
        var categories: [String] = []

        dishes.forEach { d in
            let cat = d.category ?? ""
            if !cat.isEmpty && !categories.contains(cat) {
                categories.append(cat)
            }
        }

        return categories
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
        var predicateMain: NSPredicate = NSPredicate(value: true)
        if !searchText.isEmpty {
            predicateMain = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
        
        if !selectedCategory.isEmpty {
            let catPredicate = NSPredicate(format: "category == %@", selectedCategory)
            
            return NSCompoundPredicate(type: .and, subpredicates: [predicateMain, catPredicate])
        } else {
            return predicateMain
        }
    }
}

#Preview {
    Menu()
}
