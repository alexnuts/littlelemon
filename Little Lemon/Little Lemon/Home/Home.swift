//
//  Home.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 26.11.2025.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            TabView {
                Menu()
                    .tabItem {
                        Label("Menu",systemImage: "list.dash")
                    }

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
