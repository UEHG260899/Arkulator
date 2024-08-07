//
//  HomeScreenViewModel.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/09/22.
//

import SwiftUI
import RealmSwift

protocol HomeScreenViewModelProtocol: ObservableObject {
    var dinosaurs: [Dinosaur] { get set }
    var queryString: String { get set }
    var shouldShowForm: Bool { get set }
    var showError: Bool { get set }
    var navbarVisibility: Visibility { get }

    func fetchDinosaurs()
    func filterDinosaurs(query: String)
    func filerBy(map: ArkMap)
    func deleteDinosaur(at index: IndexSet)
}

class HomeScreenViewModel: HomeScreenViewModelProtocol {

    @Published var dinosaurs = [Dinosaur]()
    @Published var queryString = ""
    @Published var shouldShowForm = false
    @Published var showError = false

    var navbarVisibility: Visibility {
        showError ? .hidden : .visible
    }

    private let storageManager: StorageManagerProtocol

    init(realmManager: StorageManagerProtocol) {
        self.storageManager = realmManager
    }

    func fetchDinosaurs() {
        setDinosaurs()
    }

    func filterDinosaurs(query: String) {
        guard !query.isEmpty else {
            setDinosaurs()
            return
        }

        let filteredDinos = dinosaurs.filter { $0.name.contains(query.lowercased()) }
        dinosaurs = filteredDinos
    }

    private func setDinosaurs() {
        let cachedDinosaurs = storageManager.fetch(type: Dinosaur.self)
        dinosaurs = Array(cachedDinosaurs)
    }

    func filerBy(map: ArkMap) {
        guard map != .all else {
            fetchDinosaurs()
            return
        }

        let filteredDinos = storageManager.fetch(type: Dinosaur.self, map: map)
        dinosaurs = filteredDinos
    }

    func deleteDinosaur(at index: IndexSet) {
        guard let dinosaur = dinosaurs[safe: index.first ?? 0] else {
            showError = true
            fetchDinosaurs()
            return
        }

        storageManager.delete(dinosaur)
        fetchDinosaurs()
    }

}
