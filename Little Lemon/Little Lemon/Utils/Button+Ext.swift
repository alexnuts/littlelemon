//
//  Button+Ext.swift
//  Little Lemon
//
//  Created by Alex Oriekhov on 07.12.2025.
//

import Foundation
import SwiftUI

extension Button {
    func styleYellowButton() -> some View {
        self.buttonSizing(.flexible)
            .tint(LLTheme.Colors.variant)
            .foregroundStyle(LLTheme.Colors.textPrimary)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 8))
            .controlSize(.large)
    }
    
    func stylePrimaryButton() -> some View {
        self.buttonSizing(.fitted)
            .cornerRadius(8)
            .tint(LLTheme.Colors.primary)
            .foregroundStyle(LLTheme.Colors.onPrimaryText)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 8))
            .controlSize(.large)
    }
    
    func styleSecondaryButton() -> some View {
        self.buttonSizing(.fitted)
            .tint(.white)
            .border(LLTheme.Colors.primary, width: 1)
            .foregroundStyle(LLTheme.Colors.primary)
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle(radius: 8))
            .controlSize(.large)
    }
}
