//
//  General.swift
//  StudySwift
//
//  Created by z Hahn on 2022/7/22.
//

import Foundation
import UIKit

enum CellType: Int {
    case widget = 0 // 小组件
    case senior = 1 // 高阶函数
    case cgdTimer = 2 // CGD 定时器
    case generic = 3 // 范性
    case asyncAndAwait = 4 // async await
    case memory = 5 // 内存管理
    case iap = 6 // 内购
}


struct BaseModel {
    var testStr: String = ""
}

extension UIWindow {
    
    open override var canBecomeFirstResponder: Bool {
        
        return true
    }
    
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake {
            
//            ActionSheet.title("UI调试模式").message("").action("导出为 Lookin 文档", {
//                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Lookin_Export"), object: nil, userInfo: nil)
//            }).action("进入 2D 模式", {
//                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Lookin_2D"), object: nil, userInfo: nil)
//            }).action("进入 3D 模式", {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Lookin_3D"), object: nil, userInfo: nil)
//            }).cancel("取消").show(topVC)

            
        }
    }
}
