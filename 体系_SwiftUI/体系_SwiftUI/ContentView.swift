//
//  ContentView.swift
//  体系_SwiftUI
//
//  Created by z Hahn on 2022/6/13.
//

import SwiftUI

struct ContentView: View {
    
    @State var isWillShow: Bool = false
    
    func genericDemo() {
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
    
    var body: some View {
        NavigationView
        {
            HStack(alignment: .center, spacing: 0) {
                NavigationLink(destination: TimerView())
                {
                    Text("CGD定时器")
                }
            }
            .onAppear{
//                print("name123")
                print("name = \(self)")
                swiftSeniorDemo()
            }
        }
        .onAppear {
//            print("name = \(self)")
//                genericDemo()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
