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

    var body: some View {
        VStack {
            Text("Little Lemon Menu")
                .font(.title)
                .padding()

            FetchedObjects(
                predicate: NSPredicate(value: true),
                sortDescriptors: [
                    NSSortDescriptor(key: "title", ascending: true)
                ]
            ) { (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        // Step 10 (Optional): Navigation to details
                        // NavigationLink(destination: DishDetails(dish: dish)) { ... }

                        HStack {
                            VStack{
                                Text(dish.title ?? "")
                                    .font(.title)
//                                Spacer(minLength: 8.0)
                                
                                let priceStr =  dish.price > 0.0 ? String(format: "%.2f", dish.price) : "-"
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
        }.task {
            await model.reload(viewContext)
        }
    }
}

#Preview {
    Menu()
}
