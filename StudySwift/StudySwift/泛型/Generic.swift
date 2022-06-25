//
//  Generic.swift
//  体系_Swift
//
//  Created by z Hahn on 2022/6/20.
//

import Foundation

// MARK: 泛型例子

// 泛型例子1 字符串数组
// strList 字符串数组
func showGenericStringList(strList: [String]) {
    print("字符串数组 = \(strList)")
}

// 泛型例子2 数字数组
// numList 数字数组
func showGenericNumList(numList: [Int]) {
    print("数字数组 = \(numList)")
}

// 泛型例子3 泛型数组
// T 泛型数组
func showGenericTList<T>(tList: [T]) {
    print("泛型数组 = \(tList)")
}

// MARK: 关联类使用范性

// ZStateType 协议
protocol ZStateType {
    // Swift 中使用 associatedtype 关键字来设置关联类型实例
    associatedtype StateType
    
    func demo(item: StateType)
    
}

// 非泛型 使用
struct StatesInt: ZStateType {
    typealias StateType = Int
    func demo(item: Int) {
        print("关联类Int = \(item)")
    }
}

// 泛型 使用
struct StatesT<T>: ZStateType {
    func demo(item: T) {
        print("关联类T = \(item)")
    }
}

// MARK: Where 语句
func ZStateTypeWhere<t1: ZStateType, t2: ZStateType>(z1: t1, z2: t2) where t1.StateType == t2.StateType  {
    print("z1 = \(z1) and z2 \(z2)")
}

// MARK: 泛型和Any
func showGeneric<T>(n: T) {
    print("n = \(n)")
}

func showAny(n: Any) {
    print("n = \(n)")
}
