//
//  DinosaurStatsView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/07/22.
//

import SwiftUI

struct DinosaurStatsView: View {
    
    @ObservedObject var viewModel = DinosaurStatsViewModel()

    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                RoundedTextField(placeholder: "Dino name",
                                 text: $viewModel.dinosaurName)
                RoundedTextField(placeholder: "Stamina",
                                 text: $viewModel.dinosaurStamina)
                RoundedTextField(placeholder: "Weight",
                                 text: $viewModel.dinosaurWeight)
                RoundedTextField(placeholder: "Oxigen",
                                 text: $viewModel.dinosaurOxigen)
                RoundedTextField(placeholder: "Mele",
                                 text: $viewModel.dinosaurMele)
                RoundedTextField(placeholder: "Food",
                                 text: $viewModel.dinosaurFood)
                RoundedTextField(placeholder: "Movement Speed",
                                 text: $viewModel.dinosaurMovementSpeed)
                RoundedTextField(placeholder: "Health",
                                 text: $viewModel.dinosaurHealth)
                
                Button(action: {
                    viewModel.saveDinosaur()
                }, label: {
                    Text("Save")
                        .font(.title3)
                        .fontWeight(.bold)
                })
                .disabled(!viewModel.isFormValid)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    Capsule()
                        .foregroundColor(
                            viewModel.isFormValid ? .blue : .blue.opacity(0.5)
                        )
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
