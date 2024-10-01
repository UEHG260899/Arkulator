//
//  ArkMap.swift
//  ArkulatorWidgetExtension
//
//  Created by Uriel Hernandez Gonzalez on 01/11/23.
//

import Foundation
import RealmSwift

enum ArkMap: String, Identifiable, PersistableEnum {
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
}
