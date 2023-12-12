//
//  Hidable.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 21/11/23.
//

import SwiftUI

struct Hidable: ViewModifier {

    let isShowing: Bool

    func body(content: Content) -> some View {
        if isShowing {
            content
        }
    }
}
