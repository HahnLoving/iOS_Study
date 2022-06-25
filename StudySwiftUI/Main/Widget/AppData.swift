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
        let AppData = z?.value(forKey: "demo")
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
        VStack
        {
            // 和App数据交互
            Text(entry.str)
            Spacer()
            // 点击交互
            HStack
            {
                Link(destination: URL(string: "https://www.baidu.com?str=left")!) {
                    // 左 View
                    leftView()
                }
                Spacer()
                    .frame(width: 20)

                // 右 View
                Text("right")
                .widgetURL(URL(string: "https://www.baidu.com?str=right"))
                
            }
        }
    }
}


struct leftView : View {

    var body: some View {
        
        HStack {
            
            Text("Left")
        }
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
        .supportedFamilies([.systemMedium])
//        .supportedFamilies([.systemMedium, .systemLarge, .systemSmall])
    }
}
