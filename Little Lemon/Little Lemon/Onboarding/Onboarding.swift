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

    enum Field: Hashable {
        case firstName
        case lastName
        case email
    }

    @FocusState private var focusedField: Field?

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(  //                spacing: 24.0,

                ) {

                    NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                        EmptyView()
                    }

                    AppHeader(displayProfilePic: false, displayBackBtn: false)
                    HeroView(displaySearch: false)

                    VStack(alignment: .leading) {

                        Text("First name *")
                            .onboardingTextStyle()
                        TextField("First Name", text: $firstName)
                            .focused($focusedField, equals: .firstName)
                            .submitLabel(.next)
                            .onSubmit {
                                focusedField = .lastName
                            }
                        Text("Last name *")
                            .onboardingTextStyle()
                        TextField("Last Name", text: $lastName)
                            .focused($focusedField, equals: .lastName)
                            .submitLabel(.next)
                            .onSubmit {
                                focusedField = .email
                            }

                        Text("E-mail *")
                            .onboardingTextStyle()
                        TextField("E-mail", text: $email)
                            .keyboardType(.emailAddress)
                            .focused($focusedField, equals: .email)
                            .submitLabel(.done)
                            .onSubmit {
                                submitForm()
                            }
                    }
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                    .padding()

                    Button("Register") {
                        submitForm()
                    }.styleYellowButton()
                        .padding()
                        .padding(.top, 20)

                    Spacer()
                    if !message.isEmpty {
                        Text(message)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                }
            }

        }.onAppear {
            isLoggedIn = SessionUtils.isLoggedIn
        }
    }

    func submitForm() {
        if firstName.isEmpty || lastName.isEmpty
            || email.isEmpty
        {
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
}

#Preview {
    Onboarding()
}
