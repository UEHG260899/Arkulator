//
//  DinosaurStatsView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/07/22.
//

import SwiftUI

struct DinosaurStatsView: View {
    
    @State var stamina: String = ""
    @State var weight: String = ""
    @State var oxigen: String = ""
    @State var mele: String = ""
    @State var food: String = ""
    @State var movementSpeed: String = ""
    @State var health: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Stamina", text: $stamina)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Weight", text: $weight)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Oxigen", text: $oxigen)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Mele", text: $mele)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Food", text: $food)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Movement Speed", text: $movementSpeed)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Health", text: $health)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save") {
                    print("Saved")
                }
                Spacer()
            }
            .navigationTitle("Dino stats")
            .padding()
        }
    }
}

struct DinosaurStatsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DinosaurStatsView()
        }
    }
}
