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
                        Label("Item 1",systemImage: "list.dash")
                    }

                Text("2").background(.cyan)
                    .tabItem {
                        Text("Item 2")
                    }

            }.navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    Home()
}
