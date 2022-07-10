//
//  DinosaurStatsView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/07/22.
//

import SwiftUI

struct DinosaurStatsView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = DinosaurStatsViewModel()
    @State private var isAlertPresented = false
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                RoundedTextField(placeholder: "Dino name",
                                 text: $viewModel.dinosaurName)
                RoundedTextField(placeholder: "Stamina",
                                 text: $viewModel.dinosaurStamina,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Weight",
                                 text: $viewModel.dinosaurWeight,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Oxigen",
                                 text: $viewModel.dinosaurOxigen,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Mele",
                                 text: $viewModel.dinosaurMele,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Food",
                                 text: $viewModel.dinosaurFood,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Movement Speed",
                                 text: $viewModel.dinosaurMovementSpeed,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Health",
                                 text: $viewModel.dinosaurHealth,
                                 keyboardType: .numberPad)

                if #available(iOS 15.0, *) {
                    Button(action: {
                        isAlertPresented = true
                    }, label: {
                        Text("Save")
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                    })
                    .disabled(!viewModel.isFormValid)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Capsule()
                            .foregroundColor(
                                viewModel.isFormValid ? .blue : .blue.opacity(0.5)
                            )
                    )
                    .alert("Are you sure you want to save the data?", isPresented: $isAlertPresented) {
                        Button("Yes", role: .none) {
                            viewModel.saveDinosaur()
                            dismiss()
                        }
                        Button("No", role: .cancel) {}
                    }
                } else {
                    Button(action: {
                        isAlertPresented = true
                    }, label: {
                        Text("Save")
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                    })
                    .disabled(!viewModel.isFormValid)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Capsule()
                            .foregroundColor(
                                viewModel.isFormValid ? .blue : .blue.opacity(0.5)
                            )
                    )
                    .alert(isPresented: $isAlertPresented) {
                        Alert(title: Text("Are you sure you want to save the data?"),
                              primaryButton: .default(Text("No"), action: {}),
                              secondaryButton: .default(Text("Yes"), action: {
                            viewModel.saveDinosaur()
                            dismiss()
                        }))
                    }
                }
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
            .navigationTitle("Dino stats")
            .padding()
            .onTapGesture {}
            .onLongPressGesture {
                UIApplication.shared.endEditing()
            }
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
