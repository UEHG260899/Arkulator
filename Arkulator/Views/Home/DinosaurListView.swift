//
//  DinosaurListView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 04/07/22.
//

import SwiftUI
import RealmSwift

struct DinosaurListView: View {

    @ObservedResults(Dinosaur.self) var dinosaurs
    @ObservedObject var viewModel: HomeScreenViewModel
    @FocusState var isFocused: Bool

    var filteredResults: Results<Dinosaur> {
        if !viewModel.queryString.isEmpty {
            return dinosaurs.where {
                $0.name.contains(viewModel.queryString.lowercased())
            }
        }

        return dinosaurs
    }

    var body: some View {

        GeometryReader { geometry in
            VStack {

                RoundedTextField(
                    text: $viewModel.queryString,
                    isFocused: _isFocused,
                    placeholder: "Search a Dino",
                    scheme: .init(height: 10)
                )
                .padding(.horizontal)

                List {
                    ForEach(filteredResults) { dinosaur in
                        NavigationLink {
                            let editViewModel = EditDinosaurViewModel(dinosaur: dinosaur)
                            EditDinosaurScreen(viewModel: editViewModel)
                        } label: {
                            DinosaurCell(cellNumber: Int(dinosaur.id),
                                         dinosaurName: dinosaur.name.capitalized,
                                         requiredLevel: dinosaur.expectedLevel,
                                         width: geometry.size.width / 15)
                        }
                    }
                    .onDelete(perform: $dinosaurs.remove)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Dinosaur List")
        }
        .onAppear {
            viewModel.shouldRefresh = true
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button {
                    isFocused = false
                } label: {
                    Text("Done")
                }
            }
        }
    }
}

struct DinosaurListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HomeScreenViewModel()

        NavigationView {
            DinosaurListView(viewModel: viewModel)
        }
    }
}
