//
//  SmallWidgetView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 15/09/23.
//

import SwiftUI

struct SmallWidgetView: View {
    let dinosaur: Dinosaur?

    var body: some View {
        VStack(spacing: 8) {
            Text("🦖")
                .font(.largeTitle)

            VStack(spacing: 4) {
                Text(dinosaur?.name ?? "")
                    .font(.title2)
                Text(String(describing: dinosaur?.requiredLevel ?? 0))
                    .font(.subheadline)
            }
        }
    }
}

struct SmallWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallWidgetView(dinosaur: nil)
    }
}
