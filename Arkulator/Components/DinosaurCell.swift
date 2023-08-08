//
//  DinosaurCell.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 04/07/22.
//

import SwiftUI

struct DinosaurCell: View {

    let cellNumber: Int
    let dinosaurName: String
    let requiredLevel: Int

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "\(cellNumber).circle.fill")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 24)
                .foregroundColor(.uiAccentColor)

            VStack(alignment: .leading) {
                Text("Dino: \(dinosaurName)")
                    .font(.title2)
                Text("Lvl: \(requiredLevel)")
                    .font(.caption)
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
                cellNumber: 1,
                dinosaurName: "Argentavis",
                requiredLevel: 120
            )
            .previewDevice(PreviewDevice(rawValue: device))
            .previewDisplayName(device)
        }
    }
}
