//
//  ExampleView.swift
//  StudySwiftUI
//
//  Created by z Hahn on 2022/7/23.
//

import SwiftUI

struct ExampleView:BaseView {
    
    func contentLoaded() -> Bool {
        //Ask viewModel if content is loaded.
        return true
    }

    var loadedBody: some View {
        Text("Content is loaded.")
            .onAppear {
                print("name = \(self)")
            }
    }

    var unloadedBody: some View {
        Text("Fetching content...")
            .onAppear {
                print("name = \(self)")
            }
    }
        
    
}

