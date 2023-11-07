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
        default:
            ""
        }
    }
}

extension ArkMap {
    static let choosableMaps = ArkMap.allCases.filter { $0 != .all }
}
