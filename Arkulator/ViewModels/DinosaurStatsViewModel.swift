//
//  DinosaurStatsViewModel.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/07/22.
//

import SwiftUI
import RealmSwift

protocol DinosaurStatsScreenViewModelProtocol: ObservableObject {
    var formFields: [FormField] { get set }
    var dinoMap: ArkMap { get set }
    var isFormValid: Bool { get }
    var shouldShowAlert: Bool { get set }
    var navbarVisibility: Visibility { get }

    func saveDinosaur()
}

class DinosaurStatsViewModel: DinosaurStatsScreenViewModelProtocol {
    @Published var formFields = Constants.Forms.dinoStatsForm
    @Published var dinoMap: ArkMap = .island
    @Published var shouldShowAlert = false

    var isFormValid: Bool {
        var isValid = true
        formFields.forEach { isValid = !$0.fieldText.isEmpty && isValid }
        return isValid
    }

    var navbarVisibility: Visibility {
        shouldShowAlert ? .hidden : .visible
    }

    private let storageManager: StorageManagerProtocol

    init(realmManager: StorageManagerProtocol) {
        self.storageManager = realmManager
    }

    func saveDinosaur() {
        let formData = formFields.map(\.fieldText)

        let dinosaur = Dinosaur(name: formData[safe: 0] ?? "",
                                stamina: formData[safe: 1]?.intValue ?? 0,
                                weight: formData[safe: 2]?.intValue ?? 0,
                                oxigen: formData[safe: 3]?.intValue ?? 0,
                                mele: formData[safe: 4]?.intValue ?? 0,
                                food: formData[safe: 5]?.intValue ?? 0,
                                movementSpeed: formData[safe: 6]?.intValue ?? 0,
                                health: formData[safe: 7]?.intValue ?? 0,
                                map: dinoMap)

        storageManager.save(dinosaur)
    }
}
