//
//  MediumWidgetView.swift
//  ArkulatorWidgetExtension
//
//  Created by Uriel Hernandez Gonzalez on 20/09/23.
//

import SwiftUI

struct MediumWidgetView: View {
    var body: some View {
        VStack(spacing: 5) {
            HStack(spacing: 5) {
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("Argentavis")
                        Text("Lvl 141")
                        Spacer()
                    }
                    .padding(.leading)

                    Spacer()
                }
                .background(Color.green)
                .clipShape(ContainerRelativeShape())

                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("Argentavis")
                        Text("Lvl 141")
                        Spacer()
                    }
                    .padding(.leading)

                    Spacer()
                }
                .background(Color.green)
                .clipShape(ContainerRelativeShape())
            }

            HStack(spacing: 5) {
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("Argentavis")
                        Text("Lvl 141")
                        Spacer()
                    }
                    .padding(.leading)

                    Spacer()
                }
                .background(Color.green)
                .clipShape(ContainerRelativeShape())

                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("Argentavis")
                        Text("Lvl 141")
                        Spacer()
                    }
                    .padding(.leading)

                    Spacer()
                }
                .background(Color.green)
                .clipShape(ContainerRelativeShape())
            }
        }
        .frame(maxHeight: .infinity)
        .padding(12)
    }
}

struct MediumWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MediumWidgetView()
    }
}
