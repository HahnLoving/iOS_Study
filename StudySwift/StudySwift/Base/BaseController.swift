//
//  BaseController.swift
//  StudySwift
//
//  Created by z Hahn on 2022/7/22.
//

import UIKit

class BaseController: UIViewController {

    var type: CellType = .widget
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        switch type {
        case .widget:
            self.title = "小组件"
        case .senior:
            self.title = "高阶函数"
            initSenior()
        case .cgdTimer:
            self.title = "CGD定时器"
        case .generic:
            self.title = "泛型"
            initGeneric()
        case .asyncAndAwait:
            self.title = "async/await"
        case .memory:
            self.title = "内存管理"
        }
    }
    
    // MARK: Swift高阶函数
    func initSenior() {
       // map
       mapDemo()
       mapListDemo()
       
       // flatMap
       flatMapDemo()
       flatMapListDemo()

       // compactMap
       compactMapDemo()
       compactMapListDemo()

       
       // map 和 flatMap 和 compactMap区别
       mapAndFlatMapAndCompactMapDiffent()

       // reduce
       reduceDemo()

       // filter
       filterDemo()

       // shuffled
       shuffledDemo()
       
       // prefix
       prefixDemo()

       // suffix
       suffixDemo()
    }
    
    // MARK: 泛型
    func initGeneric() {
        // MARK: 泛型例子
        showGenericNumList(numList: [1,2,3])
        showGenericStringList(strList: ["你","我","他"])

        showGenericTList(tList: [1,2,3])
        showGenericTList(tList: ["你","我","他"])

        // MARK: 关联类使用范性
        let sInt = StatesInt()
        sInt.demo(item: 1)

        let sT = StatesT<String>()
        sT.demo(item: "good")

        // MARK: Where 语句
        let sT1 = StatesT<String>()
        let sT2 = StatesT<Int>()
        // 类型不相同错误 Global function 'ZStateTypeWhere(z1:z2:)' requires the types 'StatesInt.StateType' (aka 'Int') and 'String' be equivalent
//        ZStateTypeWhere(z1: sT1, z2: sT2)
        ZStateTypeWhere(z1: sT1, z2: sT1)

        // MARK: 泛型和Ang
        showGeneric(n: 1)
        showAny(n: 1)
    }

}
