//
//  EditDinosaurViewModel.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 16/07/22.
//

import Foundation

protocol EditDinosaurViewModelProtocol: ObservableObject {
    var formData: [FormField] { get set }
    var shouldShowAlert: Bool { get set }
    var isFormValid: Bool { get }

    func updateDinosaur()
}

class EditDinosaurViewModel: EditDinosaurViewModelProtocol {
    @Published var formData: [FormField] = Constants.Forms.dinoStatsForm
    @Published var shouldShowAlert = false

    private let realmManager: RealmManagerProtocol
    private let dinoId: Int64

    var isFormValid: Bool {
        var isFormValid = true
        formData.forEach { isFormValid = !$0.fieldText.isEmpty && isFormValid }
        return isFormValid
    }

    init(dinosaur: Dinosaur, realmManager: RealmManagerProtocol) {
        self.dinoId = dinosaur.id
        self.realmManager = realmManager
        self.formData[0].fieldText = dinosaur.name.capitalized
        self.formData[1].fieldText = String(dinosaur.stamina)
        self.formData[2].fieldText = String(dinosaur.weight)
        self.formData[3].fieldText = String(dinosaur.oxigen)
        self.formData[4].fieldText = String(dinosaur.mele)
        self.formData[5].fieldText = String(dinosaur.food)
        self.formData[6].fieldText = String(dinosaur.movementSpeed)
        self.formData[7].fieldText = String(dinosaur.health)
    }

    func updateDinosaur() {
        let dino = Dinosaur(
            id: dinoId,
            name: formData[safe: 0]?.fieldText ?? "",
            stamina: formData[safe: 1]?.fieldText.intValue ?? 0,
            weight: formData[safe: 2]?.fieldText.intValue ?? 0,
            oxigen: formData[safe: 3]?.fieldText.intValue ?? 0,
            mele: formData[safe: 4]?.fieldText.intValue ?? 0,
            food: formData[safe: 5]?.fieldText.intValue ?? 0,
            movementSpeed: formData[safe: 6]?.fieldText.intValue ?? 0,
            health: formData[safe: 7]?.fieldText.intValue ?? 0
        )

        realmManager.save(dino)
    }
}
