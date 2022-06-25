//
//  TestWidget.swift
//  StudySwiftUI
//
//  Created by z Hahn on 2022/6/25.
//

import SwiftUI
import WidgetKit

struct TestWidget: View {
    var body: some View {
       VStack
        {
            Text("AppGroup交互")
                .onTapGesture  {
                    // appgroup
                    let z = UserDefaults.init(suiteName: "group.zhahntest")
                    // 保存数据
                    z?.set("demo", forKey: "demo")
                    let demo = z?.value(forKey: "demo")
                    print("AppGroup交互 = \(String(describing: demo))")
                    
                    // 全部刷新
                    WidgetCenter.shared.reloadAllTimelines()
                    // 刷新指定的kind
//                    WidgetCenter.shared.reloadTimelines(ofKind: <#T##String#>)
                }
                .frame(width: 100, height: 100)
        }
    }
}

struct TestWidget_Previews: PreviewProvider {
    static var previews: some View {
        TestWidget()
    }
}
