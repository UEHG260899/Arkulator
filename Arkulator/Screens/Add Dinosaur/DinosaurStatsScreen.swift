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
        ZStack {
            Color.mainColor
                .ignoresSafeArea()

            content
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
        .arkulatorAlert(
            title: "Are you sure you want to save the data?",
            cancelButtonText: "No",
            acceptButtonText: "Yes",
            isPresented: $vm.shouldShowAlert,
            onAcceptClicked: saveDinosaur
        )
    }

    var content: some View {
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
        var dinoMap: ArkMap = .island
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
