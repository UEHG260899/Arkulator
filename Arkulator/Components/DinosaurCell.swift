//
//  DinosaurCell.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 04/07/22.
//

import SwiftUI

struct DinosaurCell: View {

    let dinosaurName: String
    let requiredLevel: Int
    let map: ArkMap

    var body: some View {
        HStack(alignment: .center) {
            Text(map.symbol)
                .font(.title)

            VStack(alignment: .leading, spacing: 5) {
                Text("Dino: \(dinosaurName)")
                    .font(.title2)

                VStack(alignment: .leading) {
                    Text("Lvl: \(requiredLevel)")
                        .font(.subheadline)
                    Text("Map: \(map.rawValue)")
                        .font(.subheadline)
                }
            }

            Spacer()
        }
        .padding()
        .background(Color.cardColor)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct DinosaurCell_Previews: PreviewProvider {

    static let devices = ["iPhone SE (3rd generation)", "iPhone 11", "iPhone 14 Pro Max"]

    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            DinosaurCell(
                dinosaurName: "Argentavis",
                requiredLevel: 120,
                map: .island
            )
            .previewDevice(PreviewDevice(rawValue: device))
            .previewDisplayName(device)
        }
    }
}
