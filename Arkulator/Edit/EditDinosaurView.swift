//
//  EditDinosaurView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 16/07/22.
//

import SwiftUI

struct EditDinosaurView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isAlertPresented = false
    @ObservedObject var viewModel: EditDinosaurViewModel
    
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
                    Button(action: showAlert){
                        Text("Save")
                            .principalButtonStyle()
                    }
                    .disabled(!viewModel.isFormValid)
                    .buttonStyle(RoundedPillButtonStyle(color: buttonBackgroundColor))
                    .alert("Are you sure you want to save the data?", isPresented: $isAlertPresented) {
                        Button("Yes", role: .none) {saveDinosaur()}
                        Button("No", role: .cancel) {}
                    }
                } else {
                    Button(action: showAlert) {
                        Text("Save")
                            .principalButtonStyle()
                    }
                    .disabled(!viewModel.isFormValid)
                    .buttonStyle(RoundedPillButtonStyle(color: buttonBackgroundColor))
                    .alert(isPresented: $isAlertPresented) {
                        confirmationAlert
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(viewModel.dinosaurName.capitalized)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
    
    var confirmationAlert: Alert {
        Alert(title: Text("Are you sure you want to save the data?"),
              primaryButton: .default(Text("No"), action: {}),
              secondaryButton: .default(Text("Yes"), action: {saveDinosaur()}))
    }
    
    var buttonBackgroundColor: Color {
        if viewModel.isFormValid {
            return .blue
        }

        return .blue.opacity(0.5)
    }
    
}

extension EditDinosaurView {
    func showAlert() {
        isAlertPresented = true
    }
    
    func saveDinosaur() {
        viewModel.updateDinosaur()
        dismiss()
    }
}

struct EditDinosaurView_Previews: PreviewProvider {
    static var previews: some View {
        let dinosaur = Dinosaur(name: "",
                                stamina: 0,
                                weight: 0,
                                oxigen: 0,
                                mele: 0,
                                food: 0,
                                movementSpeed: 0,
                                health: 0)
        
        NavigationView {
            EditDinosaurView(viewModel: EditDinosaurViewModel(dinosaur: dinosaur))
        }
    }
}
