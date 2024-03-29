//
//  ArkulatorWidget.swift
//  ArkulatorWidget
//
//  Created by Uriel Hernandez Gonzalez on 11/09/23.
//

import WidgetKit
import SwiftUI

struct ArkulatorWidgetEntryView: View {
    @Environment(\.widgetFamily) var family
    var entry: ArkulatorWidgetProvider.Entry

    var body: some View {
        ZStack {
            switch family {
            case .systemSmall:
                SmallWidgetView(dinosaur: entry.dinosaurs.first)
            case .systemMedium:
                MediumWidgetView(dinosaurs: entry.dinosaurs)
            default:
                EmptyView()
            }
        }
        .widgetBackground(
            Color("WidgetBackground")
                .ignoresSafeArea()
        )
    }

}

struct ArkulatorWidget: Widget {
    let kind: String = "ArkulatorWidget"
    let widgetDescription = "Your dino expected level at a glance"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ArkulatorWidgetProvider()) { entry in
            ArkulatorWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Arkulator Widget")
        .description(widgetDescription)
        .supportedFamilies([.systemSmall, .systemMedium])
        .contentMarginsDisabled()
    }
}

struct ArkulatorWidget_Previews: PreviewProvider {

    static let supportedFamilies: [WidgetFamily] = [
        .systemSmall,
        .systemMedium
    ]

    static var previews: some View {
        ForEach(supportedFamilies, id: \.hashValue) { family in
            ArkulatorWidgetEntryView(entry: ArkulatorWidgetEntry(date: Date(), dinosaurs: [.placeholder]))
                .previewContext(WidgetPreviewContext(family: family))
                .previewDisplayName(family.description)
        }
    }
}
