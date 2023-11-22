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

                Color.mainColor
                    .ignoresSafeArea()

                DinosaurListView(
                    dinosaurs: vm.dinosaurs,
                    onDelete: vm.deleteDinosaur(at:),
                    onMapSelected: vm.filerBy(map:)
                )

                NavigationLink(
                    destination: DinosaurStatsScreenFactory.make(),
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
        .arkulatorAlert(
            title: "Something went wrong when trying to delete",
            cancelButtonText: "Ok",
            isPresented: $vm.showError
        )
        .animation(.easeIn, value: vm.dinosaurs)
    }
}

struct HomeView_Previews: PreviewProvider {

    class MockVM: HomeScreenViewModelProtocol {
        var dinosaurs = [Dinosaur]()
        var queryString = ""
        var shouldShowForm = false
        var showError = false

        func fetchDinosaurs() {}
        func filterDinosaurs(query: String) {}
        func filerBy(map: ArkMap) {}
        func deleteDinosaur(at index: IndexSet) {}
    }

    static var previews: some View {
        HomeScreen(vm: MockVM())
    }
}
