//
//  DinosaurListView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 04/07/22.
//

import SwiftUI
import RealmSwift

struct DinosaurListView: View {

    @FocusState var isFocused: Bool
    let dinosaurs: [Dinosaur]

    var body: some View {

        GeometryReader { geometry in
            VStack {
                List {
                    ForEach(dinosaurs) { dinosaur in
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
                    //.onDelete(perform: $dinosaurs.remove)
                    // TODO: Update deleting
                }
                .listStyle(.plain)
            }
            .navigationTitle("Dinosaur List")
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
        NavigationView {
            DinosaurListView(dinosaurs: [Dinosaur]())
        }
    }
}
