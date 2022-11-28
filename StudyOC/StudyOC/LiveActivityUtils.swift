//
//  LiveActivityUtils.swift
//  StudySwiftUI
//
//  Created by z Hahn on 2022/11/21.
//

import Foundation
import ActivityKit

@objc
enum LiveActivityType: Int {
    case hamburger = 0
    case tea = 1
    case cookies = 2
}

@objc
@available(iOS 16.1, *)
class LiveActivityUtils: NSObject {
    
    @objc
    static func request(){
//        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
//            print("no AuthorizationInfo")
//            //监听开关状态
//            for await enablment in ActivityAuthorizationInfo().activityEnablementUpdates {
//                print("Activity AuthorizationInfo change to \(enablment)")
//            }
//            return
//        }
        
//        end()
        
        let state = LiveActivityAttributes.ContentState(prograssState: .hamburger, pushStr: "test")
        let attri = LiveActivityAttributes(name: "灵动岛")
        do {
            
            let current = try Activity.request(attributes: attri, contentState: state, pushType: .token)
//            Task {
//                for await tokenData in current.pushTokenUpdates {
//                    let mytoken = tokenData.map { String(format: "%02x", $0) }.joined()
//                    print("activity push token", mytoken)
//                }
//            }
//            Task {
//                for await state in current.contentStateUpdates {
//                    print("content state update: tip=\(state.prograssState)")
//                }
//            }
//            Task {
//                for await state in current.activityStateUpdates {
//                    print("activity state update: tip=\(state) id:\(current.id)")
//                }
//            }
            print("request success,id:\(String(describing: current.id))");
        } catch(let error) {
            print("error=",error)
        }
    }
    
    @objc
    static func update(_ type: LiveActivityType) {
        Task {
            var state: LiveActivityState = .hamburger
            switch type {
            case .hamburger:
                state = .hamburger
            case .tea:
                state = .tea
            case .cookies:
                state = .cookies
            }
            guard let current = Activity<LiveActivityAttributes>.activities.first else {
                return
            }
            print("local update");
            let state1 = LiveActivityAttributes.ContentState(prograssState: state, pushStr: "test")
            await current.update(using: state1)
        }
    }
    
    @objc
    static func end() {
        for act in Activity<LiveActivityAttributes>.activities {
            print("id:\(act.id) state:\(act.activityState)")
        }
        let activities = Activity<LiveActivityAttributes>.activities.filter { act in
            return act.activityState == .active
        }
        guard activities.count > 0 else { return }
        for item in activities {
            Task {
                print("end activity \(item.id)")
                await item.end(dismissalPolicy:.immediate)
            }
        }
    }
}


