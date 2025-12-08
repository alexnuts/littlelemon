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
    private static let kPhoneKey = "user_data_phone_key"
    private static let kIsLoggedIn = "user_data_is_authenticated"
    
    private static let kPrefOrderStatus = "pref_order_status"
    private static let kPrefPasswordChange = "pref_password_change"
    private static let kPrefSpecialOffers = "pref_special_offers"
    private static let kNewsletter = "pref_newsletter"

    static func save(
        firstName: String,
        lastName: String,
        email: String,
        phone: String? = nil,
        isLoggedIn: Bool = true
    ) {
        let defaults = UserDefaults.standard
        defaults.set(firstName, forKey: kFirstNameKey)
        defaults.set(lastName, forKey: kLastNameKey)
        defaults.set(email, forKey: kEmailKey)
        if let phone = phone {
            defaults.set(phone, forKey: kPhoneKey)
        }
        defaults.set(isLoggedIn, forKey: kIsLoggedIn)
    }
    
    static func savePrefs(
        prefOrderStatus: Bool,
        prefPasswordChange: Bool,
        prefSpeclaOffers: Bool,
        prefNewsletter: Bool
    ){
        let defaults = UserDefaults.standard
        defaults.set(prefOrderStatus, forKey: kPrefOrderStatus)
        defaults.set(prefPasswordChange, forKey: kPrefPasswordChange)
        defaults.set(prefSpeclaOffers, forKey: kPrefSpecialOffers)
        defaults.set(prefNewsletter, forKey: kNewsletter)
    }

    static func clear() {
        save(firstName: "", lastName: "", email: "", phone: "", isLoggedIn: false)
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: kPrefOrderStatus)
        defaults.removeObject(forKey: kPrefPasswordChange)
        defaults.removeObject(forKey: kPrefSpecialOffers)
        defaults.removeObject(forKey: kNewsletter)
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
    
    static var phone: String {
        UserDefaults.standard.string(forKey: kPhoneKey) ?? ""
    }
    static var isLoggedIn: Bool {
        UserDefaults.standard.bool(forKey: kIsLoggedIn)
    }
    
    static var prefOrderStatus: Bool {
        UserDefaults.standard.object(forKey: kPrefOrderStatus) as? Bool ?? true
    }
    
    static var prefPasswordChange: Bool {
        UserDefaults.standard.object(forKey: kPrefPasswordChange) as? Bool ?? true
    }
    
    static var prefSpecialOffers: Bool {
        UserDefaults.standard.object(forKey: kPrefSpecialOffers) as? Bool ?? true
    }
    
    static var prefNewsletter: Bool {
        UserDefaults.standard.object(forKey: kNewsletter) as? Bool ?? true
    }
    
}
