//
//  TimerView.swift
//  体系_SwiftUI
//
//  Created by z Hahn on 2022/6/20.
//

import SwiftUI

struct TimerView: View {
    
    private var timer: CGDTimer = CGDTimer()
    
    private func timerDo(){
        // 单例创建主线程定时器
        CGDTimer.default.setTimeInterval(interval: 1, isRepeat: true) {
            print("执行返回")

            CGDTimer.default.stop()

            CGDTimer.default.restart()
        }
        
        // 单例创建自定义程定时器
//        CGDTimer.default.setTimeInterval(ztimer: DispatchSource.makeTimerSource(), interval: 1, isRepeat: true) {
//            print("执行返回")
//
//            CGDTimer.default.stop()
//
//            CGDTimer.default.restart()
//        }
        
        // 对象创建主线程定时器
//        timer.setTimeInterval(interval: 1, isRepeat: true) { [self] in
//            print("执行返回")
//            timer.stop()
//            timer.restart()
//        }
        
//        // 对象创建自定义线程定时器
//        timer.setTimeInterval(ztimer: DispatchSource.makeTimerSource(), interval: 1, isRepeat: true) { [self] in
//            print("执行返回")
//            timer.stop()
//            timer.restart()
//        }
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                print("name = \(self)")
                self.timerDo()
            }
            .onDisappear {
                CGDTimer.default.invalidate()
                timer.invalidate()
            }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
