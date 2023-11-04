//
//  HomeFilterButton.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 03/11/23.
//

import SwiftUI

struct HomeFilterButton: View {

    let onMapSelected: ((String) -> Void)

    var body: some View {
        Menu {
            Button {
                onMapSelected("")
            } label: {
                Text("All")
            }

            ForEach(ArkMap.allCases) { map in
                Button {
                    onMapSelected(map.rawValue)
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
