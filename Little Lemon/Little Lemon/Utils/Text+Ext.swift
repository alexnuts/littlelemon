//
//  TextField+Ext.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 07.12.2025.
//

import Foundation
import SwiftUI

extension Text {
    func onboardingTextStyle() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(LLTheme.Colors.primary)
            .font(.custom("Karla-Bold", size: 13))
    }
}
