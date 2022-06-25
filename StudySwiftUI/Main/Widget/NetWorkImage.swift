//
//  NetWorkImage.swift
//  MyWidgetExtension
//
//  Created by z Hahn on 2022/6/24.
//

import WidgetKit
import SwiftUI
import Intents

struct NetWorkImageProvider: IntentTimelineProvider {
    
    var img = Image("widget_background_test")
    
    func placeholder(in context: Context) -> NetWorkImageEntry {
        NetWorkImageEntry(date: Date(), configuration: NetWorkImageIntent(), displaySize: context.displaySize, img: img)
    }

    // 定义Widget预览中如何展示，所以提供默认值要在这里
    func getSnapshot(for configuration: NetWorkImageIntent, in context: Context, completion: @escaping (NetWorkImageEntry) -> ()) {
        let entry = NetWorkImageEntry(date: Date(), configuration: configuration, displaySize: context.displaySize, img: img)
        completion(entry)
    }

    // 决定 Widget 何时刷新
    func getTimeline(for configuration: NetWorkImageIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        var img = Image("widget_background_test")
        // 占位图
        WidgetImageLoader.shareLoader.downLoadImage(imageUrl: "https://lmg.jj20.com/up/allimg/tx18/0217202027012.jpg") { result in
            switch result {
            case .success(let image):
                print("成功 = \(image)")
                img = image
                // 每隔2个小时刷新。
                let entry = NetWorkImageEntry(date: Date(), configuration: configuration, displaySize: context.displaySize,img: img)
                    // refresh the data every two hours
                let expireDate = Calendar.current.date(byAdding: .hour, value: 2, to: Date()) ?? Date()
                let timeline = Timeline(entries: [entry], policy: .after(expireDate))
                
                completion(timeline)
            case .failure(let error):
                print("失败 = \(error)")
            }
        }

    }
}

struct NetWorkImageEntry: TimelineEntry {
    let date: Date
    let configuration: NetWorkImageIntent
    let displaySize: CGSize
    let img: Image
}

struct NetWorkImageEntryView : View {
    var entry: NetWorkImageProvider.Entry

    var body: some View {
        entry.img
            .resizable()
            .frame(width: entry.displaySize.width, height: entry.displaySize.height, alignment: .center)
    }
}


// 单个
//@main
struct NetWorkImage: Widget {
    let kind: String = "NetWorkImage"
    var title: String = ""
    var desc: String = ""
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: NetWorkImageIntent.self, provider: NetWorkImageProvider()) { entry in
            NetWorkImageEntryView(entry: entry)
        }
        .configurationDisplayName(title)
        .description(desc)
        .supportedFamilies([.systemMedium, .systemSmall])
//        .supportedFamilies([.systemMedium, .systemLarge, .systemSmall])
    }
}
