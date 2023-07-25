//
//  DinosaurStatsView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/07/22.
//

import SwiftUI

struct DinosaurStatsScreen<ViewModel: DinosaurStatsScreenViewModelProtocol>: View {

    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @StateObject var vm: ViewModel
    @State private var isAlertPresented = false
    @FocusState var isFocused: Bool

    var buttonBackgroundColor: Color {
        if vm.isFormValid {
            return .uiAccentColor
        }

        return .uiAccentColor.opacity(0.5)
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
                    text: $vm.dinosaurName,
                    isFocused: _isFocused,
                    placeholder: "Dino name",
                    scheme: .init(shadow: .init(color: textFieldShadowColor))
                )

                RoundedTextField(
                    text: $vm.dinosaurStamina,
                    isFocused: _isFocused,
                    placeholder: "Stamina",
                    scheme: .init(keyboardType: .numberPad, shadow: .init(color: textFieldShadowColor))
                )

                RoundedTextField(
                    text: $vm.dinosaurWeight,
                    isFocused: _isFocused,
                    placeholder: "Weight",
                    scheme: .init(keyboardType: .numberPad, shadow: .init(color: textFieldShadowColor))
                )

                RoundedTextField(
                    text: $vm.dinosaurOxigen,
                    isFocused: _isFocused,
                    placeholder: "Oxigen",
                    scheme: .init(keyboardType: .numberPad, shadow: .init(color: textFieldShadowColor))
                )

                RoundedTextField(
                    text: $vm.dinosaurMele,
                    isFocused: _isFocused,
                    placeholder: "Mele",
                    scheme: .init(keyboardType: .numberPad, shadow: .init(color: textFieldShadowColor))
                )

                RoundedTextField(
                    text: $vm.dinosaurFood,
                    isFocused: _isFocused,
                    placeholder: "Food",
                    scheme: .init(keyboardType: .numberPad, shadow: .init(color: textFieldShadowColor))
                )

                RoundedTextField(
                    text: $vm.dinosaurMovementSpeed,
                    isFocused: _isFocused,
                    placeholder: "Movement Speed",
                    scheme: .init(keyboardType: .numberPad, shadow: .init(color: textFieldShadowColor))
                )

                RoundedTextField(
                    text: $vm.dinosaurHealth,
                    isFocused: _isFocused,
                    placeholder: "Health",
                    scheme: .init(keyboardType: .numberPad, shadow: .init(color: textFieldShadowColor))
                )

                RoundedButton(
                    text: "Save",
                    isDisabled: !vm.isFormValid,
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
            .navigationTitle("Dino stats")
            .padding()
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button(action: { isFocused = false }, label: {
                        Text("Done")
                    })
                }

                ToolbarItem(placement: .navigationBarLeading) {
                    CustomBackButton()
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
        vm.saveDinosaur()
        dismiss()
    }
}

struct DinosaurStatsView_Previews: PreviewProvider {

    class MockVM: DinosaurStatsScreenViewModelProtocol {
        var dinosaurName: String = ""
        var dinosaurStamina: String = ""
        var dinosaurWeight: String = ""
        var dinosaurOxigen: String = ""
        var dinosaurMele: String = ""
        var dinosaurFood: String = ""
        var dinosaurMovementSpeed: String = ""
        var dinosaurHealth: String = ""
        var isFormValid: Bool = false

        func saveDinosaur() {}

    }
    static var previews: some View {
        NavigationView {
            DinosaurStatsScreen(vm: MockVM())
        }
    }
}
