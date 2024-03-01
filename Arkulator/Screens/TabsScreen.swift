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

            NavigationStack {
                HomeScreenFactory.make()
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(0)

            NavigationStack {
                SettingsScreen()
            }
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
            .tag(1)

        }
        .accentColor(.uiAccentColor)
    }
}

struct TabsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabsScreen()
    }
}
