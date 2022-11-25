//
//  LiveActivityView.swift
//  StudySwiftUI
//
//  Created by z Hahn on 2022/11/21.
//

import SwiftUI

struct LiveActivityView: View {
   @State var state: LiveActivityState = .hamburger
    var body: some View {
        VStack {

            VStack(spacing: 15) {
                Button("启动灵动岛") {
                    Task {
                        if #available(iOS 16.1, *) {
                            await LiveActivityUtils.request()
                        } else {
                            print("版本需要16.1")
                        }
                    }
                }
                
                Button("更新灵动岛") {
                    switch self.state {
                    case .hamburger:
                        self.state = .tea
                    case .tea:
                        self.state = .cookies
                    case .cookies:
                        self.state = .hamburger
                    }
                    if #available(iOS 16.1, *) {
                        LiveActivityUtils.update(self.state)
                    } else {
                        print("版本需要16.1")
                    }
                }
                
                Button("停止灵动岛") {
                    if #available(iOS 16.1, *) {
                        LiveActivityUtils.end()
                    } else {
                        print("版本需要16.1")
                    }
                }
                
            }
        }.onAppear {
        }.onOpenURL { url in
//            withAnimation {
//                print("状态 = \(url)")
//            }
        }
        .padding(.bottom, 50)
        
    
    }
    
}



