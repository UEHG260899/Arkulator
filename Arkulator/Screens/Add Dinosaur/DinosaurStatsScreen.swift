//
//  DinosaurStatsView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/07/22.
//

import SwiftUI

struct DinosaurStatsScreen: View {

    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel = DinosaurStatsViewModel()
    @State private var isAlertPresented = false
    @FocusState var isFocused: Bool

    var buttonBackgroundColor: Color {
        if viewModel.isFormValid {
            return Constants.UIColors.uiAccentColor
        }

        return Constants.UIColors.uiAccentColor.opacity(0.5)
    }

    var textFieldShadowColor: Color {
        if colorScheme == .light {
            return .black
        }

        return .white
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                RoundedTextField(
                    text: $viewModel.dinosaurName,
                    isFocused: _isFocused,
                    placeholder: "Dino name",
                    scheme: .init(shadow: .init(color: textFieldShadowColor))
                )

                RoundedTextField(
                    text: $viewModel.dinosaurStamina,
                    isFocused: _isFocused,
                    placeholder: "Stamina",
                    scheme: .init(keyboardType: .numberPad, shadow: .init(color: textFieldShadowColor))
                )

                RoundedTextField(
                    text: $viewModel.dinosaurWeight,
                    isFocused: _isFocused,
                    placeholder: "Weight",
                    scheme: .init(keyboardType: .numberPad, shadow: .init(color: textFieldShadowColor))
                )

                RoundedTextField(
                    text: $viewModel.dinosaurOxigen,
                    isFocused: _isFocused,
                    placeholder: "Oxigen",
                    scheme: .init(keyboardType: .numberPad, shadow: .init(color: textFieldShadowColor))
                )

                RoundedTextField(
                    text: $viewModel.dinosaurMele,
                    isFocused: _isFocused,
                    placeholder: "Mele",
                    scheme: .init(keyboardType: .numberPad, shadow: .init(color: textFieldShadowColor))
                )

                RoundedTextField(
                    text: $viewModel.dinosaurFood,
                    isFocused: _isFocused,
                    placeholder: "Food",
                    scheme: .init(keyboardType: .numberPad, shadow: .init(color: textFieldShadowColor))
                )

                RoundedTextField(
                    text: $viewModel.dinosaurMovementSpeed,
                    isFocused: _isFocused,
                    placeholder: "Movement Speed",
                    scheme: .init(keyboardType: .numberPad, shadow: .init(color: textFieldShadowColor))
                )

                RoundedTextField(
                    text: $viewModel.dinosaurHealth,
                    isFocused: _isFocused,
                    placeholder: "Health",
                    scheme: .init(keyboardType: .numberPad, shadow: .init(color: textFieldShadowColor))
                )

                RoundedButton(
                    text: "Save",
                    isDisabled: !viewModel.isFormValid,
                    action: showAlert,
                    scheme: .init(backgroundColor: buttonBackgroundColor)
                )
                .alert("Are you sure you want to save the data?", isPresented: $isAlertPresented) {
                    Button("Yes", role: .none, action: saveDinosaur)
                    Button("No", role: .cancel, action: {})
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
                    Button(action: { isFocused = false }, label: {
                        Text("Done")
                    })
                }
            }
        }
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
