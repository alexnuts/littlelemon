//
//  Home.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 26.11.2025.
//

import CoreData
import SwiftUI

struct Home: View {

    let persistenceController = PersistenceController.shared

    var body: some View {
        NavigationStack {
            Menu()
                .environment(
                    \.managedObjectContext,
                    persistenceController.container.viewContext
                )

        }.navigationBarBackButtonHidden(true)
//            .navigationBarHidden(true)
        //        VStack {
        //            TabView {
        //                Menu()
        //                    .tabItem {
        //                        Label("Menu",systemImage: "list.dash")
        //                    }
        //                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
        //
        //                UserProfile()
        //                    .tabItem {
        //                        Label("Profile",systemImage: "square.and.pencil")
        //                    }
        //
        //            }.navigationBarBackButtonHidden(true)
        //        }
    }
}

#Preview {
    Home()
}
