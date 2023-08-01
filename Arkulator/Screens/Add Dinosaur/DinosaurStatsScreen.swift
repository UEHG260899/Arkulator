//
//  DinosaurStatsView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/07/22.
//

import SwiftUI

struct DinosaurStatsScreen<ViewModel: DinosaurStatsScreenViewModelProtocol>: View {

    @Environment(\.dismiss) var dismiss
    @StateObject var vm: ViewModel
    @FocusState var isFocused: Field?

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(vm.formFields) { formField in
                    ARKTextField(
                        text: $vm.formFields.first { $0.id == formField.id }!.fieldText,
                        isFocused: _isFocused,
                        fieldType: formField.fieldType,
                        placeholder: formField.fieldLabel,
                        scheme: formField.scheme,
                        keyboardType: formField.keyboardType
                    )
                }

                ARKButton(
                    labelText: "Save",
                    isDisabled: !vm.isFormValid,
                    action: { vm.shouldShowAlert = true }
                )
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Dino stats")
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button(action: { isFocused = nil }, label: {
                    Text("Done")
                })
            }

            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton()
            }
        }
        .alert("Are you sure you want to save the data?", isPresented: $vm.shouldShowAlert) {
            Button("Yes", role: .none, action: saveDinosaur)
            Button("No", role: .cancel, action: {})
        }
    }

}

// MARK: - Helper functions
private extension DinosaurStatsScreen {

    func saveDinosaur() {
        vm.saveDinosaur()
        dismiss()
    }
}

struct DinosaurStatsView_Previews: PreviewProvider {

    class MockVM: DinosaurStatsScreenViewModelProtocol {
        var formFields = [FormField]()
        var isFormValid = false
        var shouldShowAlert = false

        func saveDinosaur() {}
    }

    static var previews: some View {
        NavigationView {
            DinosaurStatsScreen(vm: MockVM())
        }
    }
}
