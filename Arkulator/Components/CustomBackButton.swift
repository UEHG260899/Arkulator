//
//  CustomBackButton.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/07/22.
//

import SwiftUI

struct CustomBackButton: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button(action: dismiss) {
            Image(systemName: "arrow.left")
        }
    }
}

struct CustomBackButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackButton()
    }
}
