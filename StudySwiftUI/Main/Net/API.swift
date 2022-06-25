//
//  API.swift
//  MyWidgetExtension
//
//  Created by z Hahn on 2022/6/22.
//

import Foundation
import Moya
import CommonCrypto
import AdSupport
import AppTrackingTransparency

enum API {

    case getQuizListApi
    
    case easyRequset
    
}

extension API: TargetType {
    var baseURL: URL {
        switch self {
        case .easyRequset:
            return URL.init(string: Moya_baseURL)!
        default:
            return URL.init(string: (Moya_baseURL))!
        }
    }
    
    var path: String {
        switch self {

        case .easyRequset:
            return ""
        case .getQuizListApi:
            return "json/quiz.json"
        }
    }
    
    var method: Moya.Method {
        
        switch self {
        case .easyRequset:
            return .get
        case .getQuizListApi:
            return .get
        default:
            return .post
        }
    }
    

    //    这个是做单元测试模拟的数据，必须要实现，只在单元测试文件中有作用
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }

    //    该条请API求的方式,把参数之类的传进来
    var task: Task {
        
        var dic = [String: Any]()
        
        switch self {

        case .easyRequset:
            return .requestPlain
        
        case .getQuizListApi:
            return .requestPlain
        }
        
        let data = self.encryption(paraDict: dic)
        return .requestData(data)

    }
 
    func encryption(paraDict: [String: Any]) -> Data {
        
        let jsonString = paraDict.jsonString()
        
        let data = self.JSONStringToData(jsonString ?? "")
        
        return data!
    }
    

    
    /// 字符串/JSON字符串转Data
    func JSONStringToData(_ jsonString: String) -> Data? {
        let data = jsonString.data(using: String.Encoding.utf8, allowLossyConversion: false)
        return data
    }

    
    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
        ]
    }
 
}


public extension Dictionary{
    func jsonString(prettify: Bool = false) -> String? {
        guard JSONSerialization.isValidJSONObject(self) else { return nil }
        let options = (prettify == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions()
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: options) else { return nil }
        return String(data: jsonData, encoding: .utf8)
    }
}
