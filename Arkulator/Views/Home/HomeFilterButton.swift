//
//  HomeFilterButton.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 03/11/23.
//

import SwiftUI

struct HomeFilterButton: View {

    let onMapSelected: ((ArkMap) -> Void)

    var body: some View {
        Menu {
            Button {
                // TODO: Add an All map option without displaying it in the picker
                onMapSelected(.island)
            } label: {
                Text("All")
            }

            ForEach(ArkMap.allCases) { map in
                Button {
                    onMapSelected(map)
                } label: {
                    Text(map.rawValue)
                }
            }
        } label: {
            Image(systemName: "line.3.horizontal.decrease.circle")
        }
    }
}

#Preview {
    HomeFilterButton(onMapSelected: {_ in})
}
