//
//  ARKTextFieldScheme.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 22/07/23.
//

import SwiftUI

struct ARKTextFieldScheme {
    var zStackAlignment: Alignment
    var placeholderForegroundColor: Color
    var placeholderBackgroundColor: Color
    var cornerRadius: CGFloat
    var strokeColor: Color
    var horizontalPadding: CGFloat?
    var animationDuration: CGFloat

    init(
        zStackAlignment: Alignment = .leading,
        placeholderForegroundColor: Color = .textFieldColor,
        placeholderBackgroundColor: Color = .mainColor,
        cornerRadius: CGFloat = 4,
        strokeColor: Color = .textFieldColor,
        horizontalPadding: CGFloat? = nil,
        animationDuration: CGFloat = 0.1
    ) {
        self.zStackAlignment = zStackAlignment
        self.placeholderForegroundColor = placeholderForegroundColor
        self.placeholderBackgroundColor = placeholderBackgroundColor
        self.cornerRadius = cornerRadius
        self.strokeColor = strokeColor
        self.horizontalPadding = horizontalPadding
        self.animationDuration = animationDuration
    }
}
