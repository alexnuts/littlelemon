//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 27.11.2025.
//

import SwiftUI

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation
    
    let firstName = SessionUtils.fisrtName
    let lastName = SessionUtils.lastName
    let email = SessionUtils.email
    
    var body: some View {
        VStack {

            Text("Personal information")
                .font(.largeTitle)
            
            Image("profile-image-placeholder")
                .resizable(resizingMode: .stretch)
                .frame(width: 96, height: 96)
                .clipShape(.circle)
                .border(Color(.secondarySystemBackground), width: 1)
            Spacer()
            HStack{
                Text(firstName)
                    .font(.system(size: 24))
                Text(lastName)
                    .font(.system(size: 24))
            }
            Spacer()
            Text(email)
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.secondary)
            
            Spacer()
                .frame(height: .infinity)
            
            Button("Logout") {
                SessionUtils.clear()
                presentation.wrappedValue.dismiss()
            }
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            .padding(.bottom, 32)
            

        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    UserProfile()
}
