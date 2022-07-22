//
//  SwiftSeniorView.swift
//  StudySwiftUI
//
//  Created by z Hahn on 2022/7/22.
//

import SwiftUI

struct SwiftSeniorView: View {
    
 
    var body: some View {
        Text("高阶函数")
        .onAppear {
            swiftSeniorDemo()
            print("name = \(self)")
        }
        .navigationTitle("高阶函数")
    }
}

