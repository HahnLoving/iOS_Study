//
//  WidgetKitManager.swift
//  StudyOC
//
//  Created by z Hahn on 2022/6/25.
//

import WidgetKit

@objc
@available(iOS 14.0, *)
class WidgetKitManager: NSObject {

    @objc
    static let shareManager = WidgetKitManager()
    
    /// MARK: 刷新所有小组件
    @objc
    func reloadAllTimelines() {
       #if arch(arm64) || arch(i386) || arch(x86_64)
            WidgetCenter.shared.reloadAllTimelines()
            #endif
    }

    /// MARK: 刷新单个小组件
    /*
     kind: 小组件Configuration 中的kind
     */
    @objc
    func reloadTimelines(kind: String) {
          #if arch(arm64) || arch(i386) || arch(x86_64)
        WidgetCenter.shared.reloadTimelines(ofKind: kind)
            #endif
    }
}

