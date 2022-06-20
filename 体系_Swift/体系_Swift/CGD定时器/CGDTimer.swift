//
//  CGDTimer.swift
//  体系_Swift
//
//  Created by z Hahn on 2022/6/20.
//

import Foundation


class CGDTimer: NSObject {
    static let `default` = CGDTimer()
    
    private var timer: DispatchSourceTimer?
    
    deinit {
        timer?.cancel()
    }
    
    // 暂停定时器
    func stop() {
        timer?.suspend()
    }
    
    // 重启定时器
    func restart() {
        timer?.resume()
    }
    
    // 清除定时器
    func invalidate() {
        timer?.cancel()
    }
    
    // 主线程设置CGD定时器
    // interval 时间
    // isRepeat 是否循环
    // block 执行返回
    func setTimeInterval(interval: Int, isRepeat: Bool = false, block: @escaping  () -> Void) {
        // 默认在主队列中调度使用
        timer = DispatchSource.makeTimerSource()
        
        var timeType: DispatchTimeInterval = .never
        if isRepeat {
            timeType = .seconds(interval)
        }
        timer?.schedule(deadline: DispatchTime.now(), repeating: timeType, leeway: .nanoseconds(1))
        
        timer?.setEventHandler {
            DispatchQueue.main.async {
                // 执行任务
                block()
            }
        }
        
        timer?.setRegistrationHandler(handler: {
            DispatchQueue.main.async {
                // Timer开始工作了
            }
        })
//        timer?.activate()
        timer?.resume()
    }
    
    // 线程设置CGD定时器
    // ztimer 对应线程
    // interval 时间
    // isRepeat 是否循环
    // block 执行返回
    func setTimeInterval(ztimer: DispatchSourceTimer, interval: Int, isRepeat: Bool = false, block: @escaping  () -> Void) {
        timer = ztimer

        var timeType: DispatchTimeInterval = .never
        if isRepeat {
            timeType = .seconds(interval)
        }
        timer?.schedule(deadline: DispatchTime.now(), repeating: timeType, leeway: .nanoseconds(1))
        
        timer?.setEventHandler {
            DispatchQueue.main.async {
                // 执行任务
                block()
            }
        }
        
        timer?.setRegistrationHandler(handler: {
            DispatchQueue.main.async {
                // Timer开始工作了
            }
        })
//        timer?.activate()
        timer?.resume()
    }
    
    
}
