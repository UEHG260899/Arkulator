//
//  EditDInosaurScreenFactory.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 29/07/23.
//

import SwiftUI

enum EditDinosaurScreenFactory {
    static func make(with dinosaur: Dinosaur) -> some View {
        let realmManager = RealmManager()
        let viewModel = EditDinosaurViewModel(dinosaur: dinosaur, realmManager: realmManager)
        let view = EditDinosaurScreen(vm: viewModel)
        return view
    }
}
