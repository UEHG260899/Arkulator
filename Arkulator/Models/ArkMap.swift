//
//  ArkMap.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 31/10/23.
//

import Foundation

enum ArkMap: Int, CaseIterable, Identifiable {
    case island
    case scorchedEarth
    case aberration
    case extintion
    case genesisPt1
    case genesisPt2

    var id: Self { self }

    var stringRepresentation: String {
        switch self {
        case .island:
            "The Island"
        case .scorchedEarth:
            "Scorched Earth"
        case .aberration:
            "Aberration"
        case .extintion:
            "Extintion"
        case .genesisPt1:
            "Genesis Pt. 1"
        case .genesisPt2:
            "Genesis Pt. 2"
        }
    }
}
