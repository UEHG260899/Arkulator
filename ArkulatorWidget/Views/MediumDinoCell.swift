//
//  MediumDinoCell.swift
//  ArkulatorWidgetExtension
//
//  Created by Uriel Hernandez Gonzalez on 23/09/23.
//

import SwiftUI

struct MediumDinoCell: View {

    let dinosaur: Dinosaur

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Spacer()
                Text(dinosaur.name.capitalized)
                Text("Lvl \(dinosaur.requiredLevel)")
                Spacer()
            }
            .padding(.leading)

            Spacer()
        }
        .background(.ultraThinMaterial)
        .clipShape(ContainerRelativeShape())
    }
}

struct MediumDinoCell_Previews: PreviewProvider {
    static var previews: some View {
        MediumDinoCell(dinosaur: .placeholder)
    }
}
