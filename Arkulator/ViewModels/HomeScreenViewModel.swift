//
//  HomeScreenViewModel.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/09/22.
//

import Foundation
import RealmSwift

protocol HomeScreenViewModelProtocol: ObservableObject {
    var dinosaurs: [Dinosaur] { get set }
    var queryString: String { get set }
    var shouldShowForm: Bool { get set }
    var showError: Bool { get set }

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

    private let realmManager: RealmManagerProtocol

    init(realmManager: RealmManagerProtocol) {
        self.realmManager = realmManager
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
        let cachedDinosaurs = realmManager.fetch(type: Dinosaur.self)
        dinosaurs = Array(cachedDinosaurs)
    }

    func filerBy(map: ArkMap) {
        guard map != .all else {
            fetchDinosaurs()
            return
        }

        let filteredDinos = realmManager.fetch(type: Dinosaur.self, map: map)
        dinosaurs = Array(filteredDinos)
    }

    func deleteDinosaur(at index: IndexSet) {
        guard let dinosaur = dinosaurs[safe: index.first ?? 0] else {
            showError = true
            fetchDinosaurs()
            return
        }

        realmManager.delete(dinosaur)
        fetchDinosaurs()
    }

}
