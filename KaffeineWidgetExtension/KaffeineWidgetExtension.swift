//
//  KaffeineWidgetExtension.swift
//  KaffeineWidgetExtension
//
//  Created by Giulia on 13/10/21.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    static let model: CaffeineModel = CaffeineModel()
    
    func placeholder(in context: Context) -> CaffeineEntry {
        CaffeineEntry(date: Date(), configuration: ConfigurationIntent(), amount: 3)
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (CaffeineEntry) -> ()) {
        Provider.model.retrieveCaffeine()
        
        let entry = CaffeineEntry(date: Date(), configuration: configuration, amount: Provider.model.caffeineQuantity)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        Provider.model.retrieveCaffeine()
        
        let currentDate = Date()
        let entry = CaffeineEntry(date: currentDate, configuration: configuration, amount: Provider.model.caffeineQuantity)
        
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct CaffeineEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let amount: Int
}

struct KaffeineWidgetExtensionEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack{
            Image(systemName: "cup.and.saucer").font(.system(size: 112))
            Text(entry.amount.getString())
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .padding()
    }
}

@main
struct KaffeineWidgetExtension: Widget {
    let kind: String = "KaffeineWidgetExtension"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            KaffeineWidgetExtensionEntryView(entry: entry)
        }
        .configurationDisplayName("Coffee counter")
        .description("This widget display an amount of coffee for the specified timespan.")
    }
}

struct KaffeineWidgetExtension_Previews: PreviewProvider {
    static var previews: some View {
        KaffeineWidgetExtensionEntryView(entry: CaffeineEntry(date: Date(), configuration: ConfigurationIntent(), amount: 3))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
