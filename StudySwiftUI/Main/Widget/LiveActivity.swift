//
//  LiveActivity.swift
//  StudySwiftUI
//
//  Created by z Hahn on 2022/11/21.
//

import ActivityKit
import WidgetKit
import SwiftUI



public enum LiveActivityState: String, Codable, Hashable {
    case hamburger = "hamburger"
    case tea = "tea"
    case cookies = "cookies"
    
    func name() -> String {
        switch self {
        case .hamburger:
            return "汉堡包"
        case .tea:
            return "茶"
        case .cookies:
            return "饼干"
        }
    }
    
}


public struct LiveActivityAttributes: ActivityAttributes {
    
    public struct ContentState: Codable, Hashable {
        // 可变的属性需要放在这里，activity调用update进行数据的更新
        public var prograssState: LiveActivityState
        public var pushStr: String
    }
    
    // 一个灵动岛任务的初始化数据
    public var name: String
}

@available(iOS 16.1, *)
struct LiveActivity: Widget {
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LiveActivityAttributes.self) { context in
            // 在锁屏页 或者 通知列表页中展示。
            lockView(context)
                .activityBackgroundTint(Color.cyan)
                .activitySystemActionForegroundColor(Color.black)
            
        } dynamicIsland: { context in
            
            // 灵动岛展开内容
            // 可以使用widgetUrl和Link
            DynamicIsland {
                // Dynamic Island Expanded view
                // 灵动岛长按展开后的视图
                
                DynamicIslandExpandedRegion(.leading) {
                    //leading位置的视图设置
                    HStack {

                        Link(destination: URL(string: "https://www.baidu.com?str=liveActivityLeftTilte")!) {
                            Text(context.attributes.name)
                                .font(.subheadline)
                                .bold()
                                .padding(.leading, 10)
                        }
                    }
                }

                DynamicIslandExpandedRegion(.trailing) {
                    //trailing位置的视图设置
                    HStack {
                        
                        Link(destination: URL(string: "https://www.baidu.com?str=liveActivityRightTilte")!) {
                            Text(context.state.prograssState.name())
                                .font(.subheadline)
                                .padding(.trailing, 10)
                        }
                        
                    }
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                    //bottom位置的视图设置
                    ZStack {
                        Divider()
                            .frame(height: 2)
                            .background(.white.opacity(0.5))
                            .background(in: Capsule())
                            .padding(.leading, 22)
                            .padding(.trailing, 22)
                        
                        HStack {
                            ForEach([LiveActivityState.hamburger, .tea, .cookies], id:\.self) { state in
                                
                                Link(destination: URL(string: "https://www.baidu.com?str=\(state.rawValue)")!) {
                                    VStack {
                                        Image(state.rawValue)
                                            .padding(.leading, 40)
                                            .padding(.trailing, 40)
                                            .padding(.top, 20)
                                        
                                        let choose = context.state.prograssState == state

                                        Text(state.name())
                                            .font(Font.system(size: 12))
                                            .foregroundColor(choose ? .red : .white)
                                    }
                                }
                                
                            }

                        }
                    }
                }
                
            } compactLeading: {
                
                // 灵动岛未展开时，leading位置的视图设置
                Text(context.state.prograssState.name())
                    .font(.footnote)
                
            } compactTrailing: {
                
                // 灵动岛未展开时，trailing位置的视图设置
                Image(context.state.prograssState.rawValue)
                    .padding(.trailing, 5)
                
            } minimal: {
                
                // 当有多个Live Activity时，
                // 系统将选择其中一个Live Activity作为最小化的视图展示
                Image(context.state.prograssState.rawValue)
                
            }
            // 小灵动岛只能使用同一个widgetURL
            .widgetURL(URL(string: "https://www.baidu.com?str=liveActivityLittle"))
            .keylineTint(.red)
        }
    }
    
    @available(iOS 16.1, *)
    @ViewBuilder
    func lockView(_ context: (ActivityViewContext<LiveActivityAttributes>)) -> some View {
        VStack {
            HStack {
                HStack {

                    Link(destination: URL(string: "https://www.baidu.com?str=liveActivityBGLeftTilte")!) {
                        Text(context.attributes.name)
                            .font(.subheadline)
                            .bold()
                        + Text(context.state.pushStr)
                    }

                    
                }
                .padding(.leading, 5)
                
                Spacer()
                HStack {
                    
                    Link(destination: URL(string: "https://www.baidu.com?str=liveActivityBGRightTilte")!) {
                        Text(context.state.prograssState.name())
                            .font(.subheadline)
                            .padding(.trailing, 10)
                    }
                    
                    
                }
            }
            
            HStack {
                ZStack {
                    Divider()
                        .frame(height: 2)
                        .background(.black.opacity(0.5))
                        .background(in: Capsule())
                        .padding(.leading, 22)
                        .padding(.trailing, 22)
                    
                    HStack {
                        
                        ForEach([LiveActivityState.hamburger, .tea, .cookies], id:\.self) { state in
                            
                            Link(destination: URL(string: "https://www.baidu.com?str=bg\(state.rawValue)")!) {
                                VStack {
                                    Image(state.rawValue)
                                        .padding(.leading, 40)
                                        .padding(.trailing, 40)
                                        .padding(.top, 20)
                                    
                                    let choose = context.state.prograssState == state

                                    Text(state.name())
                                        .font(Font.system(size: 12))
                                        .foregroundColor(choose ? .red : .white)
                                }
                            }
                            
                        }
                        
                    }
                }
            }
            .padding(.top, 8)
        }
        .padding(10)
        .frame(height: 120)
    }
    
}

