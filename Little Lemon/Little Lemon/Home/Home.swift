//
//  Home.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 26.11.2025.
//

import SwiftUI
import CoreData

struct Home: View {
    
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        VStack {
            TabView {
                Menu()
                    .tabItem {
                        Label("Menu",systemImage: "list.dash")
                    }
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)

                UserProfile()
                    .tabItem {
                        Label("Profile",systemImage: "square.and.pencil")
                    }

            }.navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    Home()
}
