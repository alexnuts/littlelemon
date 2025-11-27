//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 24.11.2025.
//

import SwiftUI

struct Onboarding: View {

    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""

    @State private var message: String = ""
    
    @State private var isLoggedIn = false

    var body: some View {
        NavigationView {
            VStack(
                spacing: 24.0,
            ) {
                NavigationLink(destination: Home(),isActive: $isLoggedIn){
                    EmptyView()
                }
                
                Text("Onboarding")
                    .font(Font.largeTitle)
                TextField("First Name", text: $firstName)
                    .textFieldStyle(.roundedBorder)
                TextField("Last Name", text: $lastName)
                    .textFieldStyle(.roundedBorder)
                TextField(
                    "Email",
                    text: $email,
                ).keyboardType(.emailAddress)
                    .textFieldStyle(.roundedBorder)
                Button("Register") {
                    if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
                        message = "Please fill in all fields."
                        return
                    }
                    
                    if !SessionUtils.isValidEmail(email) {
                        message = "Please enter a valid email address."
                        return
                    }
                    
                    SessionUtils.save(
                        firstName: firstName,
                        lastName: lastName,
                        email: email
                    )
                    self.message = ""
                    self.isLoggedIn = true
                }
                .buttonStyle(.borderedProminent)  // Optional styling to make it look like a button
                .controlSize(.large)
                
                Spacer()
                if !message.isEmpty {
                    Text(message)
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
            .padding(48.0)
        }
    }
}

#Preview {
    Onboarding()
}
