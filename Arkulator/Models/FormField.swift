//
//  FormField.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 25/07/23.
//

import SwiftUI

struct FormField: Identifiable {
    let id = UUID()
    let fieldType: Field
    let fieldLabel: String
    var fieldText: String
    var scheme: ARKTextFieldScheme
    var keyboardType: UIKeyboardType

    init(
        fieldType: Field,
        fieldLabel: String,
        fieldText: String = "",
        scheme: ARKTextFieldScheme = .init(),
        keyboardType: UIKeyboardType = .default
    ) {
        self.fieldType = fieldType
        self.fieldLabel = fieldLabel
        self.fieldText = fieldText
        self.scheme = scheme
        self.keyboardType = keyboardType
    }
}
