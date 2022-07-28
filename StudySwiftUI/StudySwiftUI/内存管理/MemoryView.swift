//
//  MemoryView.swift
//  StudySwiftUI
//
//  Created by z Hahn on 2022/7/27.
//

import SwiftUI



struct MemoryView: View {


    var body: some View {
        Text("内存管理")
        .onAppear {
            print("name = \(self)")
            
            // 创建对象
            var model = BaseModel()
            
            // 持有对象
            var model1: Any = model
            
            withUnsafePointer(to: &model) {ptr in print(ptr)}
            withUnsafePointer(to: &model1) {ptr in print(ptr)}
        }
        .navigationTitle("内存管理")
    }
}
