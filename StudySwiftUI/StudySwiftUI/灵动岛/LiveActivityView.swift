//
//  LiveActivityView.swift
//  StudySwiftUI
//
//  Created by z Hahn on 2022/11/21.
//

import SwiftUI

struct LiveActivityView: View {


    var body: some View {
        Text("灵动岛")
        .onAppear {
            print("name = \(self)")
            
            // 创建对象
            var model = BaseModel()
            
            // 持有对象
            var model1: Any = model
            
            withUnsafePointer(to: &model) {ptr in print(ptr)}
            withUnsafePointer(to: &model1) {ptr in print(ptr)}
        }
        .navigationTitle("灵动岛")
    }
}
