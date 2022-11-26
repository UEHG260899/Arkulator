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
                RoundedTextField(placeholder: "Search a Dino",
                                 text: $viewModel.queryString,
                                 height: 40)
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
