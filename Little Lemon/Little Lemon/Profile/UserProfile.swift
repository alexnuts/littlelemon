//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 27.11.2025.
//

import SwiftUI

struct UserProfile: View {

    @Environment(\.presentationMode) var presentation

    @State var firstName = SessionUtils.fisrtName
    @State var lastName = SessionUtils.lastName
    @State var email = SessionUtils.email
    @State var phone = SessionUtils.phone

    @State private var message: String = ""

    @State var prefOrderStatus = SessionUtils.prefOrderStatus
    @State var prefPasswordChange = SessionUtils.prefPasswordChange
    @State var prefSpecialOffers = SessionUtils.prefSpecialOffers
    @State var prefNewsletter = SessionUtils.prefNewsletter

    var body: some View {
        VStack {
            AppHeader(
                displayProfilePic: true,
                displayBackBtn: true
            )
            ScrollView {
                VStack(
                    alignment: .leading
                ) {
                    Text("Personal information")
                        .font(.title3)
                        .padding(.bottom)

                    Text("Avatar")
                        .onboardingTextStyle()
                        .fontWeight(.semibold)
                        .opacity(0.5)

                    HStack(
                        spacing: 16.0,
                    ) {
                        Image("profile-image-placeholder")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 84, height: 84)
                            .clipShape(.circle)

                        Button("Change") {
                            print("Change click")
                        }.stylePrimaryButton()

                        Button("Remove") {
                            print("Remove click")
                        }.styleSecondaryButton()

                    }.padding(.bottom)

                    VStack {
                        Text("First name")
                            .onboardingTextStyle()
                        TextField("First Name", text: $firstName)

                        Text("Last name")
                            .onboardingTextStyle()
                        TextField("Last Name", text: $lastName)

                        Text("E-mail")
                            .onboardingTextStyle()
                        TextField("E-mail", text: $email)
                            .textContentType(.emailAddress)
                            .keyboardType(.emailAddress)

                        Text("Phone number")
                            .onboardingTextStyle()
                        TextField("Phone number", text: $phone)
                            .textContentType(.telephoneNumber)
                            .keyboardType(.phonePad)
                        
                        if !message.isEmpty {
                            Text(message)
                                .padding(.top)
                                .foregroundColor(.red)
                                .font(.caption)
                        }

                    }.textFieldStyle(.roundedBorder)
                        .disableAutocorrection(true)
                        .padding(.vertical)

                    Text("Email notifications")
                        .onboardingTextStyle()
                        .padding(.bottom)

                    Toggle("Order status", isOn: $prefOrderStatus)
                        .toggleStyle(CheckboxToggleStyle())

                    Toggle("Password change", isOn: $prefPasswordChange)
                        .toggleStyle(CheckboxToggleStyle())

                    Toggle("Special offers", isOn: $prefSpecialOffers)
                        .toggleStyle(CheckboxToggleStyle())

                    Toggle("Newsletter", isOn: $prefNewsletter)
                        .toggleStyle(CheckboxToggleStyle())

                    Button("Logout") {
                        SessionUtils.clear()
//                        presentation.wrappedValue.dismiss()
                        NotificationCenter.default.post(name: Notification.Name("LogoutNotification"), object: nil)
                    }.styleYellowButton()
                        .padding(.vertical, 36.0)

                    HStack {

                        Button("Discard changes") {
                            reload()
                        }.styleSecondaryButton()

                        Button("Save changes") {
                            submitForm()
                        }.stylePrimaryButton()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color(.secondarySystemBackground), lineWidth: 1)
                )

            }
            .padding(.horizontal, 12.0)

        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationBarBackButtonHidden()
    }

    func reload() {
        self.firstName = SessionUtils.fisrtName
        self.lastName = SessionUtils.lastName
        self.email = SessionUtils.email
        self.phone = SessionUtils.phone

        self.prefOrderStatus = SessionUtils.prefOrderStatus
        self.prefNewsletter = SessionUtils.prefNewsletter
        self.prefPasswordChange = SessionUtils.prefPasswordChange
        self.prefSpecialOffers = SessionUtils.prefSpecialOffers
    }

    func submitForm() {
        if firstName.isEmpty || lastName.isEmpty
            || email.isEmpty || phone.isEmpty
        {
            message = "Please fill in all fields."
            return
        }

        if !SessionUtils.isValidEmail(email) {
            message = "Please enter a valid email address."
            return
        }

        message = ""
        SessionUtils.save(
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone
        )
        SessionUtils.savePrefs(
            prefOrderStatus: prefOrderStatus,
            prefPasswordChange: prefPasswordChange,
            prefSpeclaOffers: prefSpecialOffers,
            prefNewsletter: prefNewsletter
        )
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(
                systemName: configuration.isOn
                    ? "checkmark.square.fill" : "square"
            )
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundColor(LLTheme.Colors.primary)
            .onTapGesture { configuration.isOn.toggle() }
            configuration.label
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
