//
//  ArkMap.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 31/10/23.
//

import Foundation
import RealmSwift

// TODO: See if we can delete the Type
enum ArkMap: Int, Identifiable, PersistableEnum {
    case island
    case scorchedEarth
    case aberration
    case extinction
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
        case .extinction:
            "Extinction"
        case .genesisPt1:
            "Genesis Pt. 1"
        case .genesisPt2:
            "Genesis Pt. 2"
        }
    }
}
