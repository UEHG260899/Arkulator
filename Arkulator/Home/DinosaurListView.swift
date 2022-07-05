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
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                RoundedTextField(placeholder: "Search a Dino",
                                 text: $searchString,
                                 height: 40)
                .padding(.horizontal)
                List {
                    ForEach(dinosaurs) { dinosaur in
                        DinosaurCell(cellNumber: Int(dinosaur.id),
                                     dinosaurName: dinosaur.name,
                                     requiredLevel: dinosaur.expectedLevel,
                                     width: geometry.size.width / 15)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Dinosaur List")
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
