//
//  MediumWidgetView.swift
//  ArkulatorWidgetExtension
//
//  Created by Uriel Hernandez Gonzalez on 20/09/23.
//

import SwiftUI

struct MediumWidgetView: View {

    let dinosaurs: [Dinosaur]

    var body: some View {
        if dinosaurs.isEmpty {
            Text("No dinosaurs to show")
                .font(.largeTitle)
        } else {
            dinoCells
        }
    }

    private var dinoCells: some View {
        VStack(spacing: 5) {
            HStack(spacing: 5) {
                MediumDinoCell(dinosaur: getDinosaur(at: 0))

                MediumDinoCell(dinosaur: getDinosaur(at: 1))
                    .opacity(getOpacityForCell(at: 1))
            }

            HStack(spacing: 5) {
                MediumDinoCell(dinosaur: getDinosaur(at: 2))
                    .opacity(getOpacityForCell(at: 2))

                MediumDinoCell(dinosaur: getDinosaur(at: 3))
                    .opacity(getOpacityForCell(at: 3))
            }
        }
        .frame(maxHeight: .infinity)
        .padding(12)
    }
}

private extension MediumWidgetView {
    func getDinosaur(at index: Int) -> Dinosaur {
        guard dinosaurs.indices.contains(index) else {
            return .placeholder
        }

        return dinosaurs[index]
    }

    func getOpacityForCell(at index: Int) -> Double {
        guard dinosaurs.indices.contains(index) else {
            return 0
        }

        return 1
    }
}

struct MediumWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MediumWidgetView(dinosaurs: [.placeholder])
    }
}
