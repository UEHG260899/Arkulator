//
//  SettingsScreen.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 27/08/22.
//

import SwiftUI

struct SettingsScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.mainColor
                    .ignoresSafeArea()

                SettingsListView()
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
