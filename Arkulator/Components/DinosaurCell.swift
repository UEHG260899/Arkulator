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
    let width: CGFloat
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "\(cellNumber).circle.fill")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: width)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading) {
                Text("Dino: \(dinosaurName)")
                    .font(.title2)
                Text("Lvl: \(requiredLevel)")
                    .font(.caption)
            }
        }
        
    }
}

struct DinosaurCell_Previews: PreviewProvider {
    static var previews: some View {
        DinosaurCell(cellNumber: 1,
                     dinosaurName: "Argentavis",
                     requiredLevel: 120,
                     width: 20)
        .previewLayout(.sizeThatFits)
    }
}
