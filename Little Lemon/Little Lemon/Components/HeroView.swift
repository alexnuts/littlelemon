//
//  HeroView.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 04.12.2025.
//

import SwiftUI

struct HeroView: View {

    let onSearch: (() -> Void)?

    init(onSearch: (() -> Void)? = nil) {
        self.onSearch = onSearch
    }

    var body: some View {
        VStack(
            alignment: .leading,
        ) {
            Text("Little Lemon")
                .foregroundStyle(LLTheme.Colors.variant)
                .font(.system(size: 48.0, weight: .semibold))
                .fontWeight(.semibold)
                .padding(.top, 12.0)
                .padding(.leading, 16.0)

            HStack {
                VStack(
                    alignment: .leading
                ) {
                    Text("Chicago")
                        .foregroundStyle(LLTheme.Colors.onPrimaryText)
                        .font(.title)
                        .fontWeight(.medium)

                    //                Spacer()
                    Text(
                        "We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist."
                    )
                    .foregroundStyle(LLTheme.Colors.onPrimaryText)
                    .font(.default)
                    .padding(.top, 1.0)
                }
                Image("hero-img")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        maxWidth: 120.0,
                        maxHeight: 140.0,
                        alignment: .trailing
                    )
                    .cornerRadius(20.0)
            }
            .padding(.horizontal, 16.0)

            if let callback = onSearch {
                Spacer().frame(height: 16.0)
                Button {
                    callback()
                } label: {
                    Image(systemName: "magnifyingglass")
                        .padding(8.0)
                        .background(Color(hex: "EDEFEE"))
                        .clipShape(Circle())
                        .foregroundStyle(LLTheme.Colors.primary)
                }
                .padding(.horizontal, 16.0)
            }
            Spacer().frame(height: 24.0)

            //                .backgroundColor(Color(hex: "EDEFEE"))
            //                    .shape(Circle())
        }
        //        .padding(.horizontal, 16.0)
        .frame(maxWidth: .infinity)
        .background(LLTheme.Colors.primary)

    }
}

#Preview {
    HeroView(onSearch: {})
}
