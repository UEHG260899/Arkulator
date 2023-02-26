//
//  RoundedTextField.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/07/22.
//

import SwiftUI

struct RoundedTextField: View {

    let placeholder: String
    let keyboardType: UIKeyboardType
    let height: CGFloat?
    @Binding var text: String
    @FocusState var isFocused: Bool

    init(placeholder: String, text: Binding<String>, isFocused: FocusState<Bool>, keyboardType: UIKeyboardType = .default, height: CGFloat? = nil) {
        self.placeholder = placeholder
        self.height = height
        self.keyboardType = keyboardType
        self._text = text
        self._isFocused = isFocused
    }

    @ViewBuilder
    var body: some View {
        if let height = height {
            TextField(placeholder, text: $text)
                .keyboardType(keyboardType)
                .focused($isFocused)
                .frame(height: height)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .stroke(lineWidth: 1)
                        .foregroundColor(Constants.UIColors.textFieldColor)
                        .shadow(color: .black, radius: 10, x: 3, y: 5)
                )
        } else {
            TextField(placeholder, text: $text)
                .keyboardType(keyboardType)
                .focused($isFocused)
                .padding()
                .background(
                    Capsule()
                        .stroke(lineWidth: 1)
                        .foregroundColor(Constants.UIColors.textFieldColor)
                        .shadow(color: .black, radius: 10, x: 3, y: 5)
                )
        }
    }
}

struct RoundedTextField_Previews: PreviewProvider {
    @State static var sampleText: String = ""

    static var previews: some View {
        RoundedTextField(placeholder: "Stamina",
                         text: $sampleText,
                         isFocused: .init(),
                         keyboardType: .numberPad)
    }
}
