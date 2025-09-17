//
//  TabsScreen.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 27/08/22.
//

import SwiftUI

struct TabsScreen: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                NavigationStack {
                    HomeScreenFactory.make()
                }
            }

            Tab("Settings", systemImage: "gear") {
                NavigationStack {
                    SettingsScreen()
                }
            }

        }
        .accentColor(.uiAccentColor)
    }
}

struct TabsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabsScreen()
    }
}
