//
//  NetWorkData.swift
//  MyWidgetExtension
//
//  Created by z Hahn on 2022/6/24.
//
import WidgetKit
import SwiftUI
import Intents

struct NetWorkDataProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> NetWorkDataEntry {
        NetWorkDataEntry(date: Date(), configuration: NetWorkDataIntent(), displaySize: context.displaySize, model: ZModel())
    }

    // 定义Widget预览中如何展示，所以提供默认值要在这里
    func getSnapshot(for configuration: NetWorkDataIntent, in context: Context, completion: @escaping (NetWorkDataEntry) -> ()) {
        let entry = NetWorkDataEntry(date: Date(), configuration: configuration, displaySize: context.displaySize, model: ZModel())
        completion(entry)
    }

    // 决定 Widget 何时刷新
    func getTimeline(for configuration: NetWorkDataIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        NetWorkRequest(API.getQuizListApi, modelType: ZModel.self) { (model, responseModel) in
            // 每隔2个小时刷新。
            let entry = NetWorkDataEntry(date: Date(), configuration: configuration, displaySize: context.displaySize, model: model)
                // refresh the data every two hours
            let expireDate = Calendar.current.date(byAdding: .hour, value: 2, to: Date()) ?? Date()
            let timeline = Timeline(entries: [entry], policy: .after(expireDate))

            completion(timeline)

        } failureCallback: { (responseModel) in

            
        }
        
    }
}

struct NetWorkDataEntry: TimelineEntry {
    let date: Date
    let configuration: NetWorkDataIntent
    let displaySize: CGSize
    let model: ZModel
}

struct NetWorkDataEntryView : View {
    var entry: NetWorkDataProvider.Entry

    var body: some View {
        Text(entry.model.items.first?.title ?? "0")
    }
}


// 单个
//@main
struct NetWorkData: Widget {
    let kind: String = "NetWorkData"
    var title: String = ""
    var desc: String = ""
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: NetWorkDataIntent.self, provider: NetWorkDataProvider()) { entry in
            NetWorkDataEntryView(entry: entry)
        }
        .configurationDisplayName(title)
        .description(desc)
        .supportedFamilies([.systemMedium, .systemSmall])
//        .supportedFamilies([.systemMedium, .systemLarge, .systemSmall])
    }
}
