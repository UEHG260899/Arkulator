//
//  ArkMap.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 31/10/23.
//

import Foundation
import RealmSwift

enum ArkMap: String, Identifiable, PersistableEnum {
    case all = "All"
    case island = "The Island"
    case scorchedEarth = "Scorched Earth"
    case aberration = "Aberration"
    case extinction = "Extinction"
    case genesisPt1 = "Genesis Pt. 1"
    case genesisPt2 = "Genesis Pt. 2"
    case theCenter = "The Center"
    case ragnarok = "Ragnarok"
    case valguero = "Valguero"
    case crystalIsles = "Crystal Isles"
    case lostIsland = "Lost Island"
    case fjordur = "Fjordur"

    var id: Self { self }

    var symbol: String {
        switch self {
        case .island:
            "🏝️"
        case .scorchedEarth:
            "🏜️"
        case .aberration:
            "👹"
        case .extinction:
            "☠️"
        case .genesisPt1:
            "🌊"
        case .genesisPt2:
            "🚀"
        case .theCenter:
            "🎯"
        case .ragnarok:
            "🐉"
        case .valguero:
            "🗻"
        case .crystalIsles:
            "🪟🏝️"
        case .lostIsland:
            "❓"
        case .fjordur:
            "🇳🇴"
        default:
            ""
        }
    }
}

extension ArkMap {
    static let choosableMaps = ArkMap.allCases.filter { $0 != .all }
}
