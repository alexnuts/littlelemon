//
//  SessionUtils.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 24.11.2025.
//

import Foundation

class SessionUtils {

    private static let kFirstNameKey = "user_data_first_name_key"
    private static let kLastNameKey = "user_data_last_name_key"
    private static let kEmailKey = "user_data_email_address_key"
    private static let kIsLoggedIn = "user_data_email_address_key"

    static func save(
        firstName: String,
        lastName: String,
        email: String,
        isLoggedIn: Bool = true
    ) {
        let defaults = UserDefaults.standard
        defaults.set(firstName, forKey: kFirstNameKey)
        defaults.set(lastName, forKey: kLastNameKey)
        defaults.set(email, forKey: kEmailKey)
        defaults.set(isLoggedIn, forKey: kIsLoggedIn)
    }

    static func clear() {
        save(firstName: "", lastName: "", email: "", isLoggedIn: false)
    }

    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    static var fisrtName: String {
        UserDefaults.standard.string(forKey: kFirstNameKey) ?? ""
    }
    static var lastName: String {
        UserDefaults.standard.string(forKey: kLastNameKey) ?? ""
    }
    static var email: String {
        UserDefaults.standard.string(forKey: kEmailKey) ?? ""
    }
    static var isLoggedIn: Bool {
        UserDefaults.standard.bool(forKey: kIsLoggedIn)
    }
}
