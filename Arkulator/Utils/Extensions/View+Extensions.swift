//
//  View+Extensions.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 04/09/22.
//

import SwiftUI

extension View {
    @ViewBuilder
    func tintColor(_ color: Color) -> some View {
        if #available(iOS 15, *) {
            // As of September 4th, tint is not working as expected in iOS 15
            self.tint(color)
        } else {
            self.accentColor(color)
        }
    }
}
