//
//  AppData.swift
//  MyWidgetExtension
//
//  Created by z Hahn on 2022/6/24.
//

import WidgetKit
import SwiftUI
import Intents

struct AppDataProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> AppDataEntry {
        AppDataEntry(date: Date(), configuration: AppDataIntent(), str: "")
    }

    // 定义Widget预览中如何展示，所以提供默认值要在这里
    func getSnapshot(for configuration: AppDataIntent, in context: Context, completion: @escaping (AppDataEntry) -> ()) {
        let entry = AppDataEntry(date: Date(), configuration: configuration, str: "")
        completion(entry)
    }

    // 决定 Widget 何时刷新
    func getTimeline(for configuration: AppDataIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        let z = UserDefaults.init(suiteName: "group.zhahntest")
        let AppData = z?.value(forKey: "demo1")
        print("AppData = \(AppData)")
        
        // 每隔2个小时刷新。
        let entry = AppDataEntry(date: Date(), configuration: configuration, str: String(describing: AppData))
            // refresh the data every two hours
        let expireDate = Calendar.current.date(byAdding: .minute, value: 5, to: Date()) ?? Date()
//        print("zzr123 = \(expireDate)")
        let timeline = Timeline(entries: [entry], policy: .after(expireDate))
        
        completion(timeline)
        
    }
}

struct AppDataEntry: TimelineEntry {
    let date: Date
    let configuration: AppDataIntent
    let str: String
}

struct AppDataEntryView : View {
    var entry: AppDataProvider.Entry

    var body: some View {
        Text(entry.str)
    }
}


// 单个
//@main
struct AppData: Widget {
    let kind: String = "AppData"
    var title: String = ""
    var desc: String = ""
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: AppDataIntent.self, provider: AppDataProvider()) { entry in
            AppDataEntryView(entry: entry)
        }
        .configurationDisplayName(title)
        .description(desc)
        .supportedFamilies([.systemMedium, .systemSmall])
//        .supportedFamilies([.systemMedium, .systemLarge, .systemSmall])
    }
}
