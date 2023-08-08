//
//  DinosaurStatsViewModel.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/07/22.
//

import Foundation
import RealmSwift

protocol DinosaurStatsScreenViewModelProtocol: ObservableObject {
    var formFields: [FormField] { get set }
    var isFormValid: Bool { get }
    var shouldShowAlert: Bool { get set }

    func saveDinosaur()
}

class DinosaurStatsViewModel: DinosaurStatsScreenViewModelProtocol {
    @Published var formFields = Constants.Forms.dinoStatsForm
    @Published var shouldShowAlert = false

    var isFormValid: Bool {
        var isValid = true
        formFields.forEach { isValid = !$0.fieldText.isEmpty && isValid }
        return isValid
    }

    private let realmManager: RealmManagerProtocol

    init(realmManager: RealmManagerProtocol) {
        self.realmManager = realmManager
    }

    func saveDinosaur() {
//        let newDinosaur = Dinosaur(name: dinosaurName,
//                                   stamina: Int(dinosaurStamina) ?? 0,
//                                   weight: Int(dinosaurWeight) ?? 0,
//                                   oxigen: Int(dinosaurOxigen) ?? 0,
//                                   mele: Int(dinosaurMele) ?? 0,
//                                   food: Int(dinosaurFood) ?? 0,
//                                   movementSpeed: Int(dinosaurMovementSpeed) ?? 0,
//                                   health: Int(dinosaurHealth) ?? 0)
//        newDinosaur.save()
        let formData = formFields.map(\.fieldText)

        let dinosaur = Dinosaur(name: formData[safe: 0] ?? "",
                                stamina: formData[safe: 1]?.intValue ?? 0,
                                weight: formData[safe: 2]?.intValue ?? 0,
                                oxigen: formData[safe: 3]?.intValue ?? 0,
                                mele: formData[safe: 4]?.intValue ?? 0,
                                food: formData[safe: 5]?.intValue ?? 0,
                                movementSpeed: formData[safe: 6]?.intValue ?? 0,
                                health: formData[safe: 7]?.intValue ?? 0)

        realmManager.save(dinosaur)
    }
}
