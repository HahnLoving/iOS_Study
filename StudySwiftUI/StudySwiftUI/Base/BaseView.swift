//
//  BaseView.swift
//  StudySwiftUI
//
//  Created by z Hahn on 2022/7/23.
//

import SwiftUI

protocol BaseView: View {
    associatedtype LoadedBody: View
    associatedtype UnloadedBody: View
    
    func contentLoaded() -> Bool
    
    var loadedBody: LoadedBody { get }
    
    var unloadedBody: UnloadedBody { get }
}

extension BaseView {

    @ViewBuilder // needed to create a _ConditionalContent type from if/else
    var body: some View {
        if contentLoaded() {
            self.loadedBody
        } else {
            self.unloadedBody
        }
    }
}
