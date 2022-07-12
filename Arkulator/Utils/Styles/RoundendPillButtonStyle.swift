//
//  RoundendPillButton.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 11/07/22.
//

import SwiftUI

struct RoundedPillButtonStyle: ButtonStyle {
    
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(color)
            .clipShape(Capsule())
    }
}
