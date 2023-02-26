//
//  EditDinosaurView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 16/07/22.
//

import SwiftUI

struct EditDinosaurScreen: View {

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @State private var isAlertPresented = false
    @ObservedObject var viewModel: EditDinosaurViewModel
    @FocusState var isFocused: Bool

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
            .padding()
        }
        .navigationTitle(viewModel.dinosaurName.capitalized)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button(action: { isFocused = false  }, label: {
                    Text("Done")
                })
            }
        }
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
        let dinosaur = Dinosaur(name: "Hola",
                                stamina: 1,
                                weight: 2,
                                oxigen: 3,
                                mele: 4,
                                food: 5,
                                movementSpeed: 6,
                                health: 7)

        NavigationView {
            EditDinosaurScreen(viewModel: EditDinosaurViewModel(dinosaur: dinosaur))
        }
    }
}
