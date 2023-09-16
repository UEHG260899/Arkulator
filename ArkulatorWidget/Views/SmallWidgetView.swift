//
//  SmallWidgetView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 15/09/23.
//

import SwiftUI

struct SmallWidgetView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("🦖")
                .font(.largeTitle)

            VStack(spacing: 4) {
                Text("Argentavis")
                    .font(.title2)
                Text("Lvl. 142")
                    .font(.subheadline)
            }
        }
    }
}

struct SmallWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallWidgetView()
    }
}
