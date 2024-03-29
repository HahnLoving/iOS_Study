//
//  General.swift
//  StudySwiftUI
//
//  Created by z Hahn on 2022/7/22.
//

import Foundation

enum CellType: Int {
    case widget = 0 // 小组件
    case senior = 1 // 高阶函数
    case cgdTimer = 2 // CGD 定时器
    case generic = 3 // 范性
    case asyncAndAwait = 4 // async和await
    case memory = 5 // 内存管理
    case liveActivity = 6 // 灵动岛
}

struct BaseModel {
    var testStr: String = ""
}
