//
//  MoyaConfig.swift
//  MyWidgetExtension
//
//  Created by z Hahn on 2022/6/22.
//

import Foundation


enum EnvType {
    case OnlineServer
    case TestServer
}

// ***************************************************************************************
let Environment: EnvType = .OnlineServer
// ***************************************************************************************


/// 定义基础域名
var Moya_baseURL: String {
    get {
        switch Environment {
        case .OnlineServer:
            return "http://www.hdjc8.com/"
        case .TestServer:
            return "http://www.hdjc8.com/"
        }
    }
}


