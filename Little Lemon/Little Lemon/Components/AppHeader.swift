//
//  AppHeader.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 07.12.2025.
//

import SwiftUI

struct AppHeader: View {
    let displayProfilePic: Bool
    let displayBackBtn: Bool

    init(displayProfilePic: Bool, displayBackBtn: Bool) {
        self.displayProfilePic = displayProfilePic
        self.displayBackBtn = displayBackBtn
    }

    var body: some View {
        ZStack {
            if displayBackBtn {
                Button(action: {}) {
                    Image(systemName: "arrow.backward")
                        .padding(10.0)
                        .background(LLTheme.Colors.primary)
                        .foregroundColor(.white)
                        .clipShape(Circle())

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
            }
            Image("logo")
            if displayProfilePic {

                Image("profile-image-placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 44.0, height: 44.0)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 8)

            }
        }.frame(width: .infinity, height: 56.0)

    }
}

#Preview {
    AppHeader(
        displayProfilePic: true,
        displayBackBtn: true
    )
}
