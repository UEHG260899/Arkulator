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
        List {
            ForEach(dinosaurs) { dinosaur in
                ZStack {
                    DinosaurCell(
                        dinosaurName: dinosaur.name.capitalized,
                        requiredLevel: dinosaur.requiredLevel,
                        map: dinosaur.map
                    )

                    NavigationLink {
                        EditDinosaurScreenFactory.make(with: dinosaur)
                    } label: {
                        Text("")
                    }
                    .opacity(0)
                }
                .listRowInsets(.init())
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                .padding(.horizontal)
                .padding(.vertical, 5)
            }
            .onDelete(perform: onDelete)
        }
        .listStyle(.plain)
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
