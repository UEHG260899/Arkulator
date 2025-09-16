//
//  HomeView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 04/07/22.
//

import SwiftUI
import RealmSwift

struct HomeScreen<ViewModel: HomeScreenViewModelProtocol>: View {

    @State var vm: ViewModel

    var body: some View {
            ZStack(alignment: .bottom) {

                Color.mainColor
                    .ignoresSafeArea()

                DinosaurListView(
                    dinosaurs: vm.dinosaurs.map { Dinosaur(from: $0) },
                    onDelete: vm.deleteDinosaur(at:),
                    onMapSelected: vm.filterBy(map:)
                )

                FloatingButton {
                    vm.shouldShowForm = true
                }

            }
            .onAppear {
                vm.fetchDinosaurs()
            }
            .searchable(text: $vm.queryString, prompt: Text("Search a Dino"))
            .onChange(of: vm.queryString) { _, query in
                vm.filterDinosaurs(query: query)
            }
            .navigationDestination(isPresented: $vm.shouldShowForm, destination: DinosaurStatsScreenFactory.make)
            .alert("Something went wrong when trying to delete.", isPresented: $vm.showError) {
                Button("Ok", role: .destructive, action: {})
            }
            .animation(.easeIn, value: vm.dinosaurs)
    }
}

struct HomeView_Previews: PreviewProvider {

    class MockVM: HomeScreenViewModelProtocol {
        var dinosaurs = [UIDinosaur]()
        var queryString = ""
        var shouldShowForm = false
        var showError = false

        func fetchDinosaurs() {}
        func filterDinosaurs(query: String) {}
        func filterBy(map: ArkMap) {}
        func deleteDinosaur(at index: IndexSet) {}
    }

    static var previews: some View {
        HomeScreen(vm: MockVM())
    }
}
