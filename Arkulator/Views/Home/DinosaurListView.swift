//
//  DinosaurListView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 04/07/22.
//

import SwiftUI

struct DinosaurListView: View {

    let dinosaurs: [Dinosaur]
    let onDelete: ((IndexSet) -> Void)

    var body: some View {
        GeometryReader { geometry in
            VStack {
                List {
                    ForEach(dinosaurs) { dinosaur in
                        NavigationLink {
                            EditDinosaurScreenFactory.make(with: dinosaur)
                        } label: {
                            DinosaurCell(cellNumber: Int(dinosaur.id),
                                         dinosaurName: dinosaur.name.capitalized,
                                         requiredLevel: dinosaur.expectedLevel,
                                         width: geometry.size.width / 15)
                        }
                    }
                    .onDelete(perform: onDelete)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Dinosaur List")
    }
}

struct DinosaurListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DinosaurListView(dinosaurs: [Dinosaur](), onDelete: { _ in })
        }
    }
}
