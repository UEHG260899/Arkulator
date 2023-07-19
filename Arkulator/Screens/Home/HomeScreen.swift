//
//  HomeView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 04/07/22.
//

import SwiftUI
import RealmSwift

struct HomeScreen<ViewModel: HomeScreenViewModelProtocol>: View {

    @StateObject var vm: ViewModel

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                DinosaurListView(dinosaurs: vm.dinosaurs)

                NavigationLink(
                    destination: DinosaurStatsScreen(),
                    isActive: $vm.shouldShowForm,
                    label: {}
                )

                FloatingButton {
                    vm.shouldShowForm = true
                }
            }
            .onAppear {
                vm.fetchDinosaurs()
            }
        }
        .searchable(text: $vm.queryString, prompt: Text("Search a Dino"))
        .onChange(of: vm.queryString) { query in
            vm.filterDinosaurs(query: query)
        }
    }
}

struct HomeView_Previews: PreviewProvider {

    class MockVM: HomeScreenViewModelProtocol {
        var dinosaurs = [Dinosaur]()
        var queryString = ""
        var shouldShowForm = false

        func fetchDinosaurs() {}
        func filterDinosaurs(query: String) {}
    }

    static var previews: some View {
        HomeScreen(vm: MockVM())
    }
}
