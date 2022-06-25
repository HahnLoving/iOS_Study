//
//  SwiftSenior.swift
//  体系_SwiftUI
//
//  Created by z Hahn on 2022/6/23.
//

import Foundation


func swiftSeniorDemo() {
//        // MARK: 泛型例子
//        showGenericNumList(numList: [1,2,3])
//        showGenericStringList(strList: ["你","我","他"])
//
//        showGenericTList(tList: [1,2,3])
//        showGenericTList(tList: ["你","我","他"])
//
//        // MARK: 关联类使用范性
//        let sInt = StatesInt()
//        sInt.demo(item: 1)
//
//        let sT = StatesT<String>()
//        sT.demo(item: "good")
//
//        // MARK: Where 语句
//        let sT1 = StatesT<String>()
//        let sT2 = StatesT<Int>()
//        // 类型不相同错误 Global function 'ZStateTypeWhere(z1:z2:)' requires the types 'StatesInt.StateType' (aka 'Int') and 'String' be equivalent
////        ZStateTypeWhere(z1: sT1, z2: sT2)
//        ZStateTypeWhere(z1: sT1, z2: sT1)
//
//        // MARK: 泛型和Ang
//        showGeneric(n: 1)
//        showAny(n: 1)
        
        
        // MARK: CGD定时器
//        let btn = UIButton()
//        btn.setTitleColor(.red, for: .normal)
//        btn.setTitle("CGD定时器", for: .normal)
//        btn.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
//        btn.addTarget(self, action: #selector(clicktBtn), for: .touchUpInside)
//        self.view.addSubview(btn)
        
        // MARK: Swift高阶函数
//        // map
//        mapDemo()
//        mapListDemo()
//
//        // flatMap
//        flatMapDemo()
//        flatMapListDemo()
//
//        // compactMap
//        compactMapDemo()
//        compactMapListDemo()
//
//
//        // map 和 flatMap 和 compactMap区别
//        mapAndFlatMapAndCompactMapDiffent()
//
//        // reduce
//        reduceDemo()
//
//        // filter
//        filterDemo()
//
//        // shuffled
//        shuffledDemo()
        
        // prefix
        prefixDemo()
        
        // suffix
        suffixDemo()
}

// MARK: map使用
func mapDemo() {
    let numList = [1,2,3]
    let res = numList.map{$0 + 1}
    print("map res = \(res)")
    
//    let dic = [
//        "a": 1,
//        "b": 2,
//    ]
//    let res1 = dic.map{$0.value + 1}
//    print("map res = \(res1)")
}

var mapList = ["1","2","3"]

func mapStrDemo(str: String) -> String
{
    return str + ": map string"
}

func mapListDemo()
{
    let list = mapList.map(mapStrDemo)
    print("map list = \(list)")
}

// MARK: compactMap使用
func compactMapDemo() {
    let numList = [1,2,3]
    let res = numList.compactMap{$0 + 1}
    print("compactMap res = \(res)")
}

var compactMapList = ["1","2","3"]

func compactMapStrDemo(str: String) -> String
{
    return str + ": compactMap string"
}

func compactMapListDemo()
{
    let list = compactMapList.compactMap(compactMapStrDemo)
    print("compactMap map list = \(list)")
}

// MARK: flatMap使用
func flatMapDemo() {
    let numList = [1,2,3]
    let res = numList.flatMap{$0 + 1}
    print("flatMap res = \(res)")
}

var flatMapList = ["1","2","3"]

func flatMapStrDemo(str: String) -> String
{
    return str + ": flatMap string"
}

func flatMapListDemo()
{
    let list = mapList.flatMap(mapStrDemo)
    print("flat map list = \(list)")
}

// MARK: map 和 flatMap 和 compactMap区别
func mapAndFlatMapAndCompactMapDiffent ()
{
    // flatMap 和 compactMap 会将二维数组降成一维数组，
    let numList = [[1,2,3],[4,5,6]];
    let res = numList.flatMap { $0.map{ $0 + 2 } }
    
    let numList1 = [[1,2,3],[4,5,6]];
    let res1 = numList1.map { $0.map{ $0 + 2 } }
    
    let numList2 = [[1,2,3],[4,5,6]];
    let res2 = numList2.compactMap { $0.map{ $0 + 2 } }
    
    print("flatMapList = \(res) \nmapList = \(res1) \ncompactMapList = \(res2)")
    
    
    // flatMap 和 compactMap 会将nil去掉
    let strList: [String?] = ["AA", nil, "BB", "CC"]
    let res3 = strList.flatMap{ $0 }

    let strList1: [String?] = ["AA", nil, "BB", "CC"]
    let res4 = strList1.map{ $0 }
    
    let strList2: [String?] = ["AA", nil, "BB", "CC"]
    let res5 = strList2.compactMap{ $0 }
    print("flatMapStrList = \(res3) \nmapStrList = \(res4) \ncompactMapList = \(res5)")
}

// MARK: reduce使用
func reduceDemo(){
    let list = [1,2,3,4,5,6,7,8,9,10]
    
    // 0 为初始的数字 这里从0开始加
    // $0 是累加的值 比如说开始的时候是1，1+2之后是3， 3+3之后是6
    // $1 是后一个元素，比如说开始的时候是2，1+2之后是3，3+3之后是4
    let res = list.reduce(0) {
        $0 + $1
    }
    print("reduce list = \(res)")
}


// MARK: filter使用
func filterDemo() {
    let list = [1,2,3,4,5,6,7,8,9,10]
    let res = list.filter{
        $0 > 8
    }
    print("filter list = \(res)")
}

// MARK: shuffled
func shuffledDemo() {
    let list = [1,2,3,4,5,6,7,8,9,10]
    let res = list.shuffled()
    print("shuffled list = \(res)")
}

// MARK: prefix
func prefixDemo() {
    let list = [1,2,3,4,5,6,7,8,9,10]
    let res = list.prefix(3)
    print("prefix res = \(res)")
}


// MARK: suffix
func suffixDemo() {
    let list = [1,2,3,4,5,6,7,8,9,10]
    let res = list.suffix(3)
    print("suffix res = \(res)")
}
