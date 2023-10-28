//
//  View+Extensions.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 27/10/23.
//

import SwiftUI

extension View {
    func widgetBackground(_ shape: some ShapeStyle) -> some View {
        if #available(iOSApplicationExtension 17.0, macOSApplicationExtension 14.0, *) {
            return  containerBackground(shape, for: .widget)
        } else {
            return background(shape)
        }
    }

    func widgetBackground(_ view: some View) -> some View {
        if #available(iOSApplicationExtension 17.0, macOSApplicationExtension 14.0, *) {
            return  containerBackground(for: .widget) {
                view
            }
        } else {
            return background(view)
        }
    }
}
