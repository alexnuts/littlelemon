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

    @Environment(\.presentationMode) var presentationMode

    // Inside button:

    init(displayProfilePic: Bool, displayBackBtn: Bool) {
        self.displayProfilePic = displayProfilePic
        self.displayBackBtn = displayBackBtn
    }

    var body: some View {

        ZStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 36.0)
            HStack {
                if displayBackBtn {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.backward")
                            .padding(10.0)
                            .background(LLTheme.Colors.primary)
                            .foregroundColor(.white)
                            .clipShape(Circle())

                    }
                    .padding(.leading, 8)
                }

                Spacer().frame(height: 1.0)

                if displayProfilePic {
                    NavigationLink(destination: UserProfile()) {
                        Image("profile-image-placeholder")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 44.0, height: 44.0)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .padding(.trailing, 8)
                    }
                }
            }
        }.frame(maxWidth: .infinity)
            .frame(height: 56.0)
    }
}

#Preview {
    AppHeader(
        displayProfilePic: true,
        displayBackBtn: true
    )
}
