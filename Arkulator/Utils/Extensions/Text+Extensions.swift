//
//  Text+Extensions.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 11/07/22.
//

import SwiftUI

extension Text {
    func principalButtonStyle() -> some View {
        self
            .font(.title3)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity)
    }
}
