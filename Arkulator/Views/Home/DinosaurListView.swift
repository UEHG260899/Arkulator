//
//  DinosaurListView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 04/07/22.
//

import SwiftUI
import RealmSwift

struct DinosaurListView: View {
    
    @ObservedResults(Dinosaur.self) private var dinosaurs
    @ObservedObject var viewModel: HomeScreenViewModel
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                RoundedTextField(placeholder: "Search a Dino",
                                 text: $viewModel.queryString,
                                 height: 40)
                .padding(.horizontal)
                List {
                    ForEach(viewModel.filteredResults) { dinosaur in
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
