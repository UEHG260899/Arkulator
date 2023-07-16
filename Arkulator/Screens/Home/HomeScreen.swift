//
//  HomeView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 04/07/22.
//

import SwiftUI
import RealmSwift

struct HomeScreen: View {

    @StateObject private var viewModel = HomeScreenViewModel()

    init() {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                DinosaurListView(viewModel: viewModel)

                NavigationLink(
                    destination: DinosaurStatsScreen(),
                    isActive: $viewModel.shouldShowForm,
                    label: {}
                )

                FloatingButton {
                    viewModel.shouldShowForm = true
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
