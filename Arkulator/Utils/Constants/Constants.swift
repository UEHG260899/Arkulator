//
//  Constants.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 27/08/22.
//

import SwiftUI

typealias FAQSArray = Constants.Faqs

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

    enum Faqs {
        static var questions = [
            FAQ(
                question: "What are those emojis on the left side of the dino info?",
                answer: "Those are the visual representations of the map a Dino is registered in."
            ),
            FAQ(
                question: "Where can I see which emoji corresponds to which map?",
                answer: "\(ArkMap.island.symbol): The Island\n \(ArkMap.scorchedEarth.symbol): Scorched Earth\n \(ArkMap.aberration.symbol): Aberration\n \(ArkMap.extinction.symbol): Extinction\n \(ArkMap.genesisPt1.symbol): Genesis Pt. 1\n \(ArkMap.genesisPt2.symbol): Genesis Pt. 2\n \(ArkMap.theCenter.symbol): The Center\n \(ArkMap.ragnarok.symbol): Ragnarok\n \(ArkMap.valguero.symbol): Valguero\n \(ArkMap.crystalIsles.symbol): Crystal Isles\n \(ArkMap.lostIsland.symbol): Lost Island\n \(ArkMap.fjordur.symbol): Fjordur"
            ),
            FAQ(
                question: "The widgets take to long to update, can I change the refresh time?",
                answer: "Currently working on it."
            )
        ]
    }
}
