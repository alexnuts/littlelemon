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
            .controlSize(.large)
    }
}
