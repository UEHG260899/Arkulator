//
//  DinosaurStatsScreenFactory.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 24/07/23.
//

import SwiftUI

enum DinosaurStatsScreenFactory {
    static func make() -> some View {
        let realmManager = RealmManager()
        let viewModel = DinosaurStatsViewModel(realmManager: realmManager)
        return DinosaurStatsScreen(vm: viewModel)
    }
}
