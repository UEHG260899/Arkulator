//
//  RoundedTextField.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/07/22.
//

import SwiftUI

struct RoundedTextField: View {
    
    let placeholder: String
    let height: CGFloat?
    @Binding var text: String
    
    init(placeholder: String, text: Binding<String>, height: CGFloat? = nil) {
        self.placeholder = placeholder
        self.height = height
        self._text = text
    }
    
    @ViewBuilder
    var body: some View {
        if let height = height {
            TextField(placeholder, text: $text)
                .frame(height: height)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .stroke(lineWidth: 1)
                        .foregroundColor(.gray.opacity(0.5))
                        .shadow(color: .black, radius: 10, x: 3, y: 5)
                )
        } else {
            TextField(placeholder, text: $text)
                .padding()
                .background(
                    Capsule()
                        .stroke(lineWidth: 1)
                        .foregroundColor(.gray.opacity(0.5))
                        .shadow(color: .black, radius: 10, x: 3, y: 5)
                )
        }
    }
}

struct RoundedTextField_Previews: PreviewProvider {
    @State static var sampleText: String = ""
    
    static var previews: some View {
        RoundedTextField(placeholder: "Stamina",
                         text: $sampleText)
    }
}
