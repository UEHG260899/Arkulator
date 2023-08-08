//
//  Constants.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 27/08/22.
//

import SwiftUI

struct Constants {

    enum ColorSchemes: String, CaseIterable, Identifiable {
        case light = "Light"
        case dark = "Dark"

        var id: Self {
            self
        }
    }

    enum Forms {
        static let dinoStatsForm: [FormField] = [
            .init(fieldType: .dinoName, fieldLabel: "Dino name"),
            .init(fieldType: .dinoStamina, fieldLabel: "Stamina", keyboardType: .numberPad),
            .init(fieldType: .dinoWeight, fieldLabel: "Weight", keyboardType: .numberPad),
            .init(fieldType: .dinoOxigen, fieldLabel: "Oxygen", keyboardType: .numberPad),
            .init(fieldType: .dinoMele, fieldLabel: "Mele", keyboardType: .numberPad),
            .init(fieldType: .dinoFood, fieldLabel: "Food", keyboardType: .numberPad),
            .init(fieldType: .dinoMovementSpeed, fieldLabel: "Movement Speed", keyboardType: .numberPad),
            .init(fieldType: .dinoHealth, fieldLabel: "Health", keyboardType: .numberPad)
        ]
    }
}
