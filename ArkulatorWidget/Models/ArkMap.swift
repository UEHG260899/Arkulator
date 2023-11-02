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

    var id: Self { self }
}
