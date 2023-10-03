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
            Color("WidgetBackground")
                .ignoresSafeArea()

            switch family {
            case .systemSmall:
                SmallWidgetView(dinosaur: entry.dinosaurs.first)
            case .systemMedium:
                MediumWidgetView(dinosaurs: entry.dinosaurs)
            default:
                EmptyView()
            }
        }
    }

}

struct ArkulatorWidget: Widget {
    let kind: String = "ArkulatorWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ArkulatorWidgetProvider()) { entry in
            ArkulatorWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium])
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
