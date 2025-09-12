//
//  HomeScreenViewModel.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/09/22.
//

import SwiftUI
import RealmSwift

protocol HomeScreenViewModelProtocol: ObservableObject {
    var dinosaurs: [UIDinosaur] { get set }
    var queryString: String { get set }
    var shouldShowForm: Bool { get set }
    var showError: Bool { get set }

    func fetchDinosaurs()
    func filterDinosaurs(query: String)
    func filerBy(map: ArkMap)
    func deleteDinosaur(at index: IndexSet)
}

class HomeScreenViewModel: HomeScreenViewModelProtocol {

    @Published var dinosaurs = [UIDinosaur]()
    @Published var queryString = ""
    @Published var shouldShowForm = false
    @Published var showError = false
    
    private var storedDinos: [Dinosaur] = [Dinosaur]()


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
        let uiDinosaurs = cachedDinosaurs.map { UIDinosaur(from: $0) }
        self.dinosaurs = uiDinosaurs
        self.storedDinos = cachedDinosaurs
    }

    func filerBy(map: ArkMap) {
        guard map != .all else {
            fetchDinosaurs()
            return
        }

        let filteredDinos = storageManager.fetch(type: Dinosaur.self, map: map)
        let filteredUIDinos = filteredDinos.map { UIDinosaur(from: $0) }
        self.dinosaurs = filteredUIDinos
    }

    func deleteDinosaur(at index: IndexSet) {
        guard let dinosaur = storedDinos[safe: index.first ?? 0] else {
            showError = true
            fetchDinosaurs()
            return
        }

        storageManager.delete(dinosaur)
        fetchDinosaurs()
    }

}
