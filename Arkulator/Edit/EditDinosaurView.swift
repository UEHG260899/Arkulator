//
//  EditDinosaurView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 16/07/22.
//

import SwiftUI

struct EditDinosaurView: View {
    
    @State private var isAlertPresented = false
    @State var name: String = ""
    @State var stamina: String = ""
    @State var weight: String = ""
    @State var oxigen: String = ""
    @State var mele: String = ""
    @State var food: String = ""
    @State var speed: String = ""
    @State var health: String = ""
    
    let title: String
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                RoundedTextField(placeholder: "Dino name",
                                 text: $name)
                RoundedTextField(placeholder: "Stamina",
                                 text: $stamina,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Weight",
                                 text: $weight,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Oxigen",
                                 text: $oxigen,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Mele",
                                 text: $mele,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Food",
                                 text: $food,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Movement Speed",
                                 text: $speed,
                                 keyboardType: .numberPad)
                RoundedTextField(placeholder: "Health",
                                 text: $health,
                                 keyboardType: .numberPad)
                
                if #available(iOS 15.0, *) {
                    Button(action: showAlert){
                        Text("Save")
                            .principalButtonStyle()
                    }
                    .disabled(true)
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
                    .disabled(true)
                    .buttonStyle(RoundedPillButtonStyle(color: buttonBackgroundColor))
                    .alert(isPresented: $isAlertPresented) {
                        confirmationAlert
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(title.capitalized)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
    
    var confirmationAlert: Alert {
        Alert(title: Text("Are you sure you want to save the data?"),
              primaryButton: .default(Text("No"), action: {}),
              secondaryButton: .default(Text("Yes"), action: {saveDinosaur()}))
    }
    
    var buttonBackgroundColor: Color {
//        if viewModel.isFormValid {
//            return .blue
//        }
//
//        return .blue.opacity(0.5)
        return .blue.opacity(0.5)
    }
}

extension EditDinosaurView {
    func showAlert() {
        isAlertPresented = true
    }
    
    func saveDinosaur() {
        
    }
}

struct EditDinosaurView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditDinosaurView(title: "Argentavis")
        }
    }
}
