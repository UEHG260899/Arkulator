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
            VStack(spacing: 20) {
                RoundedTextField(placeholder: "Stamina",
                                 text: $stamina)
                RoundedTextField(placeholder: "Weight",
                                 text: $weight)
                RoundedTextField(placeholder: "Oxigen",
                                 text: $oxigen)
                RoundedTextField(placeholder: "Mele",
                                 text: $mele)
                RoundedTextField(placeholder: "Food",
                                 text: $food)
                RoundedTextField(placeholder: "Movement Speed",
                                 text: $movementSpeed)
                RoundedTextField(placeholder: "Health",
                                 text: $health)
                
                Button("Save") {
                    print("Saved")
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    Capsule()
                        .foregroundColor(.blue)
                )
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
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
