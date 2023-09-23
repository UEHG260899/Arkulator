//
//  SmallWidgetView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 15/09/23.
//

import SwiftUI

struct SmallWidgetView: View {
    let dinosaur: Dinosaur?

    private var titleText: String {
        guard let dinoName = dinosaur?.name else {
            return ""
        }

        return dinoName.capitalized
    }

    private var descriptionText: String {
        guard let dinoLvl = dinosaur?.expectedLevel else {
            return "No Lvl"
        }

        return "Lvl. \(String(describing: dinoLvl))"
    }

    var body: some View {
        VStack(spacing: 8) {
            Text("🦖")
                .font(.largeTitle)

            VStack(spacing: 4) {
                Text(titleText)
                    .font(.title2)
                Text(descriptionText)
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
