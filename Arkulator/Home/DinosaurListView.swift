//
//  DinosaurListView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 04/07/22.
//

import SwiftUI

struct DinosaurListView: View {
    var body: some View {
        List {
            ForEach(0..<10) { number in
                Text("Hola \(number)")
                    .tag(number)
            }
        }
        .navigationTitle("Dinosaur List")
    }
}

struct DinosaurListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DinosaurListView()
        }
    }
}
