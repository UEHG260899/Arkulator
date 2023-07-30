//
//  EditDinosaurViewModel.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 16/07/22.
//

import Foundation

protocol EditDinosaurViewModelProtocol: ObservableObject {
    var dinosaurName: String { get set }
    var dinosaurStamina: String { get set }
    var dinosaurWeight: String { get set }
    var dinosaurOxigen: String { get set }
    var dinosaurMele: String { get set }
    var dinosaurFood: String { get set }
    var dinosaurMovementSpeed: String { get set }
    var dinosaurHealth: String { get set }
    var isFormValid: Bool { get }

    func updateDinosaur()
}

class EditDinosaurViewModel: EditDinosaurViewModelProtocol {

    @Published var dinosaurName: String
    @Published var dinosaurStamina: String
    @Published var dinosaurWeight: String
    @Published var dinosaurOxigen: String
    @Published var dinosaurMele: String
    @Published var dinosaurFood: String
    @Published var dinosaurMovementSpeed: String
    @Published var dinosaurHealth: String
    private let dinosaurId: Int64
    private let realmManager: RealmManagerProtocol

    var isFormValid: Bool {
        if !dinosaurName.isEmpty, !dinosaurStamina.isEmpty, !dinosaurWeight.isEmpty,
           !dinosaurOxigen.isEmpty, !dinosaurMele.isEmpty, !dinosaurFood.isEmpty,
           !dinosaurMovementSpeed.isEmpty, !dinosaurHealth.isEmpty {
            return true
        }

        return false
    }

    init(dinosaur: Dinosaur, realmManager: RealmManagerProtocol) {
        self.dinosaurId = dinosaur.id
        self.dinosaurName = dinosaur.name.capitalized
        self.dinosaurStamina = String(dinosaur.stamina)
        self.dinosaurWeight = String(dinosaur.weight)
        self.dinosaurOxigen = String(dinosaur.oxigen)
        self.dinosaurMele = String(dinosaur.mele)
        self.dinosaurFood = String(dinosaur.food)
        self.dinosaurMovementSpeed = String(dinosaur.movementSpeed)
        self.dinosaurHealth = String(dinosaur.health)
        self.realmManager = realmManager
    }

    func updateDinosaur() {
        let updatedDinosaur = Dinosaur(name: dinosaurName,
                                       stamina: Int(dinosaurStamina) ?? 0,
                                       weight: Int(dinosaurWeight) ?? 0,
                                       oxigen: Int(dinosaurOxigen) ?? 0,
                                       mele: Int(dinosaurMele) ?? 0,
                                       food: Int(dinosaurFood) ?? 0,
                                       movementSpeed: Int(dinosaurMovementSpeed) ?? 0,
                                       health: Int(dinosaurHealth) ?? 0)

        updatedDinosaur.update(id: dinosaurId)
    }
}
