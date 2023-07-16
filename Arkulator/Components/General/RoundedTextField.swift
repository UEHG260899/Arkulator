//
//  RoundedTextField.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/07/22.
//

import SwiftUI

struct RoundedTextField: View {

    @Binding var text: String
    @FocusState var isFocused: Bool
    let placeholder: String
    var scheme = RoundedTextFieldScheme()

    var body: some View {
        TextField(placeholder, text: $text)
            .keyboardType(scheme.keyboardType)
            .focused($isFocused)
            .if(scheme.height != nil, content: { view in
                view.frame(height: scheme.height)
            })
            .padding()
            .background {
                Capsule()
                    .stroke(lineWidth: scheme.strokeWidth)
                    .foregroundColor(scheme.capsuleForegroundColor)
                    .shadow(
                        color: scheme.shadow.color,
                        radius: scheme.shadow.radius,
                        x: scheme.shadow.xOffset,
                        y: scheme.shadow.yOffset
                    )
            }
    }
}

struct RoundedTextField_Previews: PreviewProvider {
    @State static var sampleText: String = ""

    static var previews: some View {
        VStack {
            RoundedTextField(
                text: $sampleText,
                isFocused: .init(),
                placeholder: "Stamina"
            )

            RoundedTextField(
                text: $sampleText,
                isFocused: .init(),
                placeholder: "Health",
                scheme: .init(height: 20, shadow: .init(color: .white))
            )
        }
    }
}

struct RoundedTextFieldScheme {
    // Textfield
    var keyboardType: UIKeyboardType = .default
    var height: CGFloat?
    var horizontalPadding: CGFloat?

    // Background capsule
    var strokeWidth: CGFloat = 1
    var capsuleForegroundColor: Color = .textFieldColor
    var shadow = Shadow()
}

struct Shadow {
    var color = Color.black
    var radius: CGFloat = 10
    var xOffset: CGFloat = 3
    var yOffset: CGFloat = 5
}
