//
//  ARKButtonScheme.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 01/08/23.
//

import SwiftUI

struct ARKButtonScheme {
    var font: Font
    var fontWeight: Font.Weight
    var fontForegroundColor: Color
    var backgroundColor: Color
    var cornerRadius: CGFloat

    init(
        font: Font = .title3,
        fontWeight: Font.Weight = .bold,
        fontForegroundColor: Color = .white,
        backgroundColor: Color = .uiAccentColor,
        cornerRadius: CGFloat = 4
    ) {
        self.font = font
        self.fontWeight = fontWeight
        self.fontForegroundColor = fontForegroundColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
}
