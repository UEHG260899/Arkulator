//
//  ArkulatorWidget.swift
//  ArkulatorWidget
//
//  Created by Uriel Hernandez Gonzalez on 11/09/23.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct ArkulatorWidgetEntryView: View {
    @Environment(\.widgetFamily) var family
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Color("WidgetBackground")
                .ignoresSafeArea()

            switch family {
            case .systemSmall:
                SmallWidgetView()
            case .systemMedium:
                MediumWidgetView()
            default:
                EmptyView()
            }
        }
    }

}

struct ArkulatorWidget: Widget {
    let kind: String = "ArkulatorWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
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
            ArkulatorWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: family))
                .previewDisplayName(family.description)
        }
    }
}
