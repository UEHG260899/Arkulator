//
//  DinosaurListView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 04/07/22.
//

import SwiftUI

struct DinosaurListView: View {
        
    @State var searchString: String = ""
    var body: some View {
        GeometryReader { geometry in
            VStack {
                TextField("Search a dino", text: $searchString)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                List {
                    ForEach(1..<11) { number in
                        DinosaurCell(cellNumber: number,
                                     dinosaurName: "Argentavis",
                                     requiredLevel: 120,
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
