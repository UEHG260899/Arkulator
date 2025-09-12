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
        ZStack {
            Color.mainColor
                .ignoresSafeArea()

            content
        }
        .navigationTitle(vm.formData[safe: 0]?.fieldText.capitalized ?? "")
        .navigationBarBackButtonHidden(true)
        .alert("Are you sure you want to save the data?", isPresented: $vm.shouldShowAlert) {
            Button("No", action: {})
            Button("Yes", action: saveDinosaur)
        }
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
        .toolbar(vm.navbarVisibility, for: .navigationBar)
        .animation(.linear, value: vm.navbarVisibility)
    }

    var content: some View {
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

                ARKPicker(selectedMap: $vm.dinoMap)

                ARKButton(
                    labelText: "Save",
                    isDisabled: !vm.isFormValid,
                    action: { vm.shouldShowAlert = true }
                )

            }
            .padding()
        }
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
        var dinoMap: ArkMap = .island
        var shouldShowAlert = false
        var isFormValid = false
        var navbarVisibility: Visibility = .visible

        func updateDinosaur() {}
    }

    static var previews: some View {
        NavigationView {
            EditDinosaurScreen(vm: MockVM())
        }
    }
}
