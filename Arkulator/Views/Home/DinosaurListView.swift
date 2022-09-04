//
//  DinosaurListView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 04/07/22.
//

import SwiftUI
import RealmSwift

struct DinosaurListView: View {
    
    @State var searchString: String = ""
    @ObservedResults(Dinosaur.self) var dinosaurs
    
    var filteredResults: Results<Dinosaur> {
        if !searchString.isEmpty {
            return dinosaurs.where {
                $0.name.contains(searchString.lowercased())
            }
        }
        
        return dinosaurs
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                RoundedTextField(placeholder: "Search a Dino",
                                 text: $searchString,
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
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Dinosaur List")
        }
        .onAppear {
            // TODO: Fix state management for Realm
            searchString = "a"
            searchString = ""
        }
    }
}

struct DinosaurListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DinosaurListView()
        }
    }
}
