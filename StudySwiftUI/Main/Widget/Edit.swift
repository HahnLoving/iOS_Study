//
//  Edit.swift
//  MyWidgetExtension
//
//  Created by z Hahn on 2022/6/24.
//

import WidgetKit
import SwiftUI
import Intents


struct EditProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> EditEntry {
        EditEntry(date: Date(), configuration: EditIntent())
    }
    //    typealias Entry = EditEntry
    func getSnapshot(for configuration: EditIntent, in context: Context, completion: @escaping (EditEntry) -> Void) {
        let entry = EditEntry(date: Date(), configuration: configuration)
        completion(entry)
    }
    func getTimeline(for configuration: EditIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        let entry = EditEntry(date: Date(), configuration: configuration)
            // refresh the data every two hours
        let expireDate = Calendar.current.date(byAdding: .hour, value: 2, to: Date()) ?? Date()
        let timeline = Timeline(entries: [entry], policy: .after(expireDate))
        completion(timeline)
    }
}

struct EditEntry: TimelineEntry {
    public let date: Date
    let configuration: EditIntent
}

struct EditEntryView : View {
    //这里是Widget的类型判断
    var entry: EditProvider.Entry
    
    @ViewBuilder
    var body: some View {
        VStack(alignment: .center) {
            if entry.configuration.title == "请编辑小组件" {
                Text("请编辑小组件吧")
                    .font(.headline)
                    .foregroundColor(Color.gray)
            }else {
                Text(entry.configuration.title ?? "")
                    .font(.headline)
                    .foregroundColor(Color.gray)
            }
        }
        .padding(.all)
    }
    
}



struct Edit: Widget {
    private let kind: String = "Edit"
    var title: String = ""
    var desc: String = ""
    
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: EditIntent.self, provider: EditProvider()) { entry in
            EditEntryView(entry: entry)
        }
        .configurationDisplayName(title)
        .description(desc)
        .supportedFamilies([.systemSmall])
        
    }
}

