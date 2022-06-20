//
//  TimerController.swift
//  体系_Swift
//
//  Created by z Hahn on 2022/6/20.
//

import UIKit

class TimerController: UIViewController {
    
    private var timer: CGDTimer = CGDTimer()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("name = \(self)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        CGDTimer.default.invalidate()
        self.timer.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 单例创建主线程定时器
//        CGDTimer.default.setTimeInterval(interval: 1, isRepeat: true) {
//            print("执行返回")
//
//            CGDTimer.default.stop()
//
//            CGDTimer.default.restart()
//        }
        
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
        
        // 对象创建自定义线程定时器
        timer.setTimeInterval(ztimer: DispatchSource.makeTimerSource(), interval: 1, isRepeat: true) { [self] in
            print("执行返回")
            timer.stop()
            timer.restart()
        }
    }
    


}
