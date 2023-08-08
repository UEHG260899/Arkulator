//
//  HomeScreenFactory.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 18/07/23.
//

import SwiftUI

enum HomeScreenFactory {
    static func make() -> some View {
        let realmManager = RealmManager()
        let viewModel = HomeScreenViewModel(realmManager: realmManager)
        let view = HomeScreen(vm: viewModel)
        return view
    }
}
