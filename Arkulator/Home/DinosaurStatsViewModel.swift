//
//  DinosaurStatsViewModel.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/07/22.
//

import Foundation
import RealmSwift

class DinosaurStatsViewModel: ObservableObject {
    @Published var dinosaurName: String = ""
    @Published var dinosaurStamina: String = ""
    @Published var dinosaurWeight: String = ""
    @Published var dinosaurOxigen: String = ""
    @Published var dinosaurMele: String = ""
    @Published var dinosaurFood: String = ""
    @Published var dinosaurMovementSpeed: String = ""
    @Published var dinosaurHealth: String = ""

    var isFormValid: Bool {
        if dinosaurName.isEmpty || dinosaurStamina.isEmpty || dinosaurWeight.isEmpty || dinosaurOxigen.isEmpty || dinosaurMele.isEmpty || dinosaurFood.isEmpty || dinosaurMovementSpeed.isEmpty || dinosaurHealth.isEmpty {
            return false
        }
        
        return true
    }
    
    private var test: Results<Dinosaur>!
    

    func saveDinosaur() {
        let newDinosaur = Dinosaur(name: dinosaurName,
                                   stamina: Int(dinosaurStamina) ?? 0,
                                   weight: Int(dinosaurWeight) ?? 0,
                                   oxigen: Int(dinosaurOxigen) ?? 0,
                                   mele: Int(dinosaurMele) ?? 0,
                                   food: Int(dinosaurFood) ?? 0,
                                   movementSpeed: Int(dinosaurMovementSpeed) ?? 0,
                                   health: Int(dinosaurHealth) ?? 0)
        newDinosaur.save()
    }
}
