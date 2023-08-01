//
//  EditDinosaurView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 16/07/22.
//

import SwiftUI

struct EditDinosaurScreen<ViewModel: EditDinosaurViewModelProtocol>: View {

    @Environment(\.dismiss) var dismiss
    @StateObject var vm: ViewModel
    @FocusState var isFocused: Field?

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                ForEach(vm.formData) { field in
                    ARKTextField(
                        text: $vm.formData.first { $0.id == field.id }!.fieldText,
                        isFocused: _isFocused,
                        fieldType: field.fieldType,
                        placeholder: field.fieldLabel,
                        scheme: field.scheme,
                        keyboardType: field.keyboardType
                    )
                }

                RoundedButton(
                    text: "Save",
                    isDisabled: !vm.isFormValid,
                    action: { vm.shouldShowAlert = true },
                    scheme: .init(backgroundColor: buttonBackgroundColor)
                )

            }
            .padding()
        }
        .navigationTitle(vm.formData[safe: 0]?.fieldText.capitalized ?? "")
        .navigationBarBackButtonHidden(true)
        .alert("Are you sure you want to save the data?", isPresented: $vm.shouldShowAlert) {
            Button("Yes", role: .none, action: saveDinosaur)
            Button("No", role: .cancel, action: {})
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button(action: { isFocused = nil  }, label: {
                    Text("Done")
                })
            }

            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton()
            }
        }
    }

    var buttonBackgroundColor: Color {
        if vm.isFormValid {
            return .uiAccentColor
        }

        return .uiAccentColor.opacity(0.5)
    }

}

private extension EditDinosaurScreen {
    func saveDinosaur() {
        vm.updateDinosaur()
        dismiss()
    }
}

struct EditDinosaurView_Previews: PreviewProvider {

    class MockVM: EditDinosaurViewModelProtocol {
        var formData = [FormField]()
        var shouldShowAlert = false
        var isFormValid = false

        func updateDinosaur() {}
    }

    static var previews: some View {
        NavigationView {
            EditDinosaurScreen(vm: MockVM())
        }
    }
}
