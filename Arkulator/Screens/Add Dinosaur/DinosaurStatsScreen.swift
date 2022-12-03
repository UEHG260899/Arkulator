//
//  DinosaurStatsView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/07/22.
//

import SwiftUI

struct DinosaurStatsScreen: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = DinosaurStatsViewModel()
    @State private var isAlertPresented = false
    @FocusState var isFocused: Bool
    
    var buttonBackgroundColor: Color {
        if viewModel.isFormValid {
            return Constants.UIColors.uiAccentColor
        }
        
        return Constants.UIColors.uiAccentColor.opacity(0.5)
    }
    
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
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
            .navigationTitle("Dino stats")
            .padding()
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
    
    var confirmationAlert: Alert {
        Alert(title: Text("Are you sure you want to save the data?"),
              primaryButton: .default(Text("No"), action: {}),
              secondaryButton: .default(Text("Yes"), action: {saveDinosaur()}))
    }
}

// MARK: - Helper functions
extension DinosaurStatsScreen {
    
    func showAlert() {
        isAlertPresented = true
    }
    
    func saveDinosaur() {
        viewModel.saveDinosaur()
        dismiss()
    }
}

struct DinosaurStatsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DinosaurStatsScreen()
        }
    }
}
