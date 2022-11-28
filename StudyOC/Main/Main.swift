//
//  MainWidget.swift
//  MainWidget
//
//  Created by z Hahn on 2022/6/24.
//

//import WidgetKit
//import SwiftUI
//
//struct Provider: TimelineProvider {
//    // 占位视图，例如网络请求失败、发生未知错误、第一次展示小组件都会展示这个view
//    func placeholder(in context: Context) -> SimpleEntry {
//        SimpleEntry(date: Date())
//    }
//
//    // 定义Widget预览中如何展示，所以提供默认值要在这里
//    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
//        let entry = SimpleEntry(date: Date())
//        completion(entry)
//    }
//
//    // 决定 Widget 何时刷新
//    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//        var entries: [SimpleEntry] = []
//
//        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = SimpleEntry(date: entryDate)
//            entries.append(entry)
//        }
//
//        let timeline = Timeline(entries: entries, policy: .atEnd)
//        completion(timeline)
//    }
//}
//
//// 渲染 Widget 所需的数据模型，需要遵守TimelineEntry协议
//struct SimpleEntry: TimelineEntry {
//    let date: Date
//}
//
//// 渲染的view
//struct MainWidgetEntryView : View {
//    var entry: Provider.Entry
//
//    var body: some View {
//        Text(entry.date, style: .time)
//    }
//}
//
//
//@main
//struct MainWidget: Widget {
//    // 主件唯一标识符
//    let kind: String = "MainWidget"
//
//    var body: some WidgetConfiguration {
//        StaticConfiguration(kind: kind, provider: Provider()) { entry in
//            MainWidgetEntryView(entry: entry)
//        }
//        // 标题
//        .configurationDisplayName("Main Widget")
//        // 详情
//        .description("This is an example widget.")
//        // 枚举设置
//        .supportedFamilies([.systemMedium, .systemSmall, .systemLarge])
//    }
//}
//
//// SwiftUI Xcode 测试预览视图
//struct MainWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        MainWidgetEntryView(entry: SimpleEntry(date: Date()))
//            .previewContext(WidgetPreviewContext(family: .systemSmall))
//    }
//}

import WidgetKit
import SwiftUI
import Intents

struct SimpleEntry: TimelineEntry {
    public let date: Date
}

struct PlaceholderView : View {
    //这里是PlaceholderView - 提醒用户选择部件功能
    var body: some View {
        Text("Place Holder")
    }
}

@main
struct MainWidget: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        NetWorkData(title: "网络请求小组件", desc: "网络请求小组件列表")
        NetWorkImage(title: "网络图片小组件", desc: "网络图片小组件列表")
        Edit(title: "编辑小组件", desc: "编辑小组件列表")
        AppData(title: "app数据交互小组件", desc: "app数据交互小组件列表")
        if #available(iOS 16.1, *) {
            LiveActivity()
        }
    }
}
