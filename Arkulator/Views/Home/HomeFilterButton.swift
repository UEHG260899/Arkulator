//
//  HomeFilterButton.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 03/11/23.
//

import SwiftUI

struct HomeFilterButton: View {

    @AppStorage("selectedMap") private var selectedMap: ArkMap = .all
    let onMapSelected: ((ArkMap) -> Void)

    var body: some View {
        Menu {
            ForEach(ArkMap.allCases) { map in
                Button {
                    selectedMap = map
                } label: {
                    itemLabel(for: map)
                }
            }
        } label: {
            Image(systemName: "line.3.horizontal.decrease.circle")
        }
    }

    @ViewBuilder
    private func itemLabel(for map: ArkMap) -> some View {
        if selectedMap == map {
            Label(map.rawValue, systemImage: "checkmark")
        } else {
            Text(map.rawValue)
        }
    }
}

#Preview {
    HomeFilterButton(onMapSelected: {_ in})
}
