//
//  EditDinosaurView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 16/07/22.
//

import SwiftUI

struct EditDinosaurScreen: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isAlertPresented = false
    @ObservedObject var viewModel: EditDinosaurViewModel
    @FocusState var isFocused: Bool
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                RoundedTextField(placeholder: "Dino name",
                                 text: $viewModel.dinosaurName,
                                 isFocused: _isFocused)
                RoundedTextField(placeholder: "Stamina",
                                 text: $viewModel.dinosaurStamina,
                                 isFocused: _isFocused,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Weight",
                                 text: $viewModel.dinosaurWeight,
                                 isFocused: _isFocused,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Oxigen",
                                 text: $viewModel.dinosaurOxigen,
                                 isFocused: _isFocused,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Mele",
                                 text: $viewModel.dinosaurMele,
                                 isFocused: _isFocused,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Food",
                                 text: $viewModel.dinosaurFood,
                                 isFocused: _isFocused,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Movement Speed",
                                 text: $viewModel.dinosaurMovementSpeed,
                                 isFocused: _isFocused,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Health",
                                 text: $viewModel.dinosaurHealth,
                                 isFocused: _isFocused,
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
    
    var confirmationAlert: Alert {
        Alert(title: Text("Are you sure you want to save the data?"),
              primaryButton: .default(Text("No"), action: {}),
              secondaryButton: .default(Text("Yes"), action: {saveDinosaur()}))
    }
    
    var buttonBackgroundColor: Color {
        if viewModel.isFormValid {
            return Constants.UIColors.uiAccentColor
        }

        return Constants.UIColors.uiAccentColor.opacity(0.5)
    }
    
}

extension EditDinosaurScreen {
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
            EditDinosaurScreen(viewModel: EditDinosaurViewModel(dinosaur: dinosaur))
        }
    }
}
