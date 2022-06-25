//
//  NetworkManager.swift
//  MyWidgetExtension
//
//  Created by z Hahn on 2022/6/22.
//

import Alamofire
import Foundation
import ObjectMapper
import Moya
import SwiftyJSON
import HandyJSON
/// 超时时长
private var requestTimeOut: Double = 30
// 单个模型的成功回调 包括： 模型，网络请求的模型(code,message,data等，具体根据业务来定)
typealias RequestModelSuccessCallback<T: HandyJSON> = ((T, ResponseModel?) -> Void)

// 数组模型的成功回调 包括： 模型数组， 网络请求的模型(code,message,data等，具体根据业务来定)
typealias RequestModelsSuccessCallback<T: HandyJSON> = (([T], ResponseModel?) -> Void)

// 失败回调 包括：网络请求的模型(code,message,data等，具体根据业务来定)
typealias RequestFailureCallback = ((ResponseModel) -> Void)
/// 网络错误的回调
typealias ErrorCallback = (() -> Void)

/// dataKey一般是 "data"  这里用的知乎daily 的接口 为stories
let dataKey = "stories"
let messageKey = "message"
let codeKey = "code"
let successCode: Int = -999

/// 网络请求的基本设置,这里可以拿到是具体的哪个网络请求，可以在这里做一些设置
private let myEndpointClosure = { (target: TargetType) -> Endpoint in
    /// 这里把endpoint重新构造一遍主要为了解决网络请求地址里面含有? 时无法解析的bug https://github.com/Moya/Moya/issues/1198
    let url = target.baseURL.absoluteString + target.path
    var task = target.task

    /*
     如果需要在每个请求中都添加类似token参数的参数请取消注释下面代码
     👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇
     */
//    let additionalParameters = ["token":"888888"]
//    let defaultEncoding = URLEncoding.default
//    switch target.task {
//        ///在你需要添加的请求方式中做修改就行，不用的case 可以删掉。。
//    case .requestPlain:
//        task = .requestParameters(parameters: additionalParameters, encoding: defaultEncoding)
//    case .requestParameters(var parameters, let encoding):
//        additionalParameters.forEach { parameters[$0.key] = $0.value }
//        task = .requestParameters(parameters: parameters, encoding: encoding)
//    default:
//        break
//    }
    /*
     👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆
     如果需要在每个请求中都添加类似token参数的参数请取消注释上面代码
     */

    var endpoint = Endpoint(
        url: url,
        sampleResponseClosure: { .networkResponse(200, target.sampleData) },
        method: target.method,
        task: task,
        httpHeaderFields: target.headers
    )
    requestTimeOut = 30 // 每次请求都会调用endpointClosure 到这里设置超时时长 也可单独每个接口设置
    // 针对于某个具体的业务模块来做接口配置
    if let apiTarget = target as? API {
        switch apiTarget {
        case .easyRequset:
            return endpoint

        default:
            return endpoint
        }
    }
    
    return endpoint
}

/// 网络请求的设置
private let requestClosure = { (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
    do {
        var request = try endpoint.urlRequest()
        // 设置请求时长
        request.timeoutInterval = requestTimeOut
        // 打印请求参数
        if let requestData = request.httpBody {
            print("请求的url：\(request.url!)" + "\n" + "\(request.httpMethod ?? "")" + "发送参数" + "\(String(data: request.httpBody!, encoding: String.Encoding.utf8) ?? "")")
        } else {
            print("请求的url：\(request.url!)" + "\(String(describing: request.httpMethod))")
        }

        if let header = request.allHTTPHeaderFields {
            print("请求头内容\(header)")
        }

        done(.success(request))
    } catch {
        done(.failure(MoyaError.underlying(error, nil)))
    }
}

/*   设置ssl
 let policies: [String: ServerTrustPolicy] = [
 "example.com": .pinPublicKeys(
     publicKeys: ServerTrustPolicy.publicKeysInBundle(),
     validateCertificateChain: true,
     validateHost: true
 )
 ]
 */

// 用Moya默认的Manager还是Alamofire的Manager看实际需求。HTTPS就要手动实现Manager了
// private public func defaultAlamofireManager() -> Manager {
//
//    let configuration = URLSessionConfiguration.default
//
//    configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
//
//    let policies: [String: ServerTrustPolicy] = [
//        "ap.grtstar.cn": .disableEvaluation
//    ]
//    let manager = Alamofire.SessionManager(configuration: configuration,serverTrustPolicyManager: ServerTrustPolicyManager(policies: policies))
//
//    manager.startRequestsImmediately = false
//
//    return manager
// }

/// NetworkActivityPlugin插件用来监听网络请求，界面上做相应的展示
/// 但这里我没怎么用这个。。。 loading的逻辑直接放在网络处理里面了
private let networkPlugin = NetworkActivityPlugin.init { changeType, _ in
    print("networkPlugin \(changeType)")
    // targetType 是当前请求的基本信息
    switch changeType {
    case .began:
        print("开始请求网络")

    case .ended:
        print("结束")
    }
}

/// https://github.com/Moya/Moya/blob/master/docs/Providers.md  参数使用说明
/// 网络请求发送的核心初始化方法，创建网络请求对象
private let Provider1 = MoyaProvider<MultiTarget>(endpointClosure: myEndpointClosure, requestClosure: requestClosure, plugins: [networkPlugin], trackInflights: false)

/// 网络请求，当模型为dict类型
/// - Parameters:
///   - target: 接口
///   - showFailAlert: 是否显示网络请求失败的弹框
///   - modelType: 模型
///   - successCallback: 成功的回调
///   - failureCallback: 失败的回调
/// - Returns: 取消当前网络请求Cancellable实例
@discardableResult
func NetWorkRequest<T: HandyJSON>(_ target: TargetType, needShowFailAlert: Bool = true, modelType: T.Type, successCallback:@escaping RequestModelSuccessCallback<T>, failureCallback: RequestFailureCallback? = nil) -> Moya.Cancellable? {
//    return NetWorkRequest(target, showFailAlert: showFailAlert, modelType: modelType, successCallback: successCallback, failureCallback: nil)
    
    
    
    return NetWorkRequest(target, needShowFailAlert: needShowFailAlert, successCallback: { (responseModel) in
        
        if let model = JSONDeserializer<T>.deserializeFrom(json: responseModel.data) {
            
            DispatchQueue.main.async {
                
                successCallback(model, responseModel)
            }
        } else {
            
            errorHandler(code: responseModel.code, message: "解析失败", needShowFailAlert: needShowFailAlert, failure: failureCallback)
        }
        
//        if let model = T(JSONString: responseModel.data) {
//
//            print("服务器传回来的数据模型\(String(describing: model.toJSONString(prettyPrint: true)))")
//
//            successCallback(model, responseModel)
//        } else {
//            errorHandler(code: responseModel.code , message: "解析失败", needShowFailAlert: needShowFailAlert, failure: failureCallback)
//        }
        
    }, failureCallback: failureCallback)
}

/// 网络请求，当模型为dict类型
/// - Parameters:
///   - target: 接口
///   - showFailAlert: 是否显示网络请求失败的弹框
///   - modelType: 模型
///   - successCallback: 成功的回调
///   - failureCallback: 失败的回调
/// - Returns: 取消当前网络请求Cancellable实例
@discardableResult
func NetWorkRequest<T: HandyJSON>(_ target: TargetType, needShowFailAlert: Bool = true, modelType: [T].Type, successCallback:@escaping RequestModelsSuccessCallback<T>, failureCallback: RequestFailureCallback? = nil) -> Moya.Cancellable? {
    return NetWorkRequest(target, needShowFailAlert: needShowFailAlert, successCallback: { (responseModel) in
        
        if let model = JSONDeserializer<T>.deserializeFrom(json: responseModel.data) {
            
            successCallback(model as! [T], responseModel)
        } else {
            
            errorHandler(code: responseModel.code, message: "解析失败", needShowFailAlert: needShowFailAlert, failure: failureCallback)
        }
        
//        if let model = [T](JSONString: responseModel.data) {
//            successCallback(model, responseModel)
//        } else {
//            errorHandler(code: responseModel.code , message: "解析失败", needShowFailAlert: needShowFailAlert, failure: failureCallback)
//        }
        
    }, failureCallback: failureCallback)
}

// func mapModel<T: HandyJSON>(_ type: T.Type) throws -> T {
//    let jsonString = String(data: data, encoding: .utf8)
//    guard let model = JSONDeserializer<T>.deserializeFrom(json: jsonString) else {
//        throw MoyaError.jsonMapping(self)
//    }
//
//    return model
// }


/// 网络请求的基础方法
/// - Parameters:
///   - target: 接口
///   - showFailAlert: 是否显示网络请求失败的弹框
///   - successCallback: 成功的回调
///   - failureCallback: 失败的回调
/// - Returns: 取消当前网络请求Cancellable实例
private func NetWorkRequest(_ target: TargetType, needShowFailAlert: Bool = true, successCallback:@escaping RequestFailureCallback, failureCallback: RequestFailureCallback? = nil) -> Moya.Cancellable? {
    
    
    // 先判断网络是否有链接 没有的话直接返回--代码略
    if !UIDevice.isNetworkConnect {
        // code = 9999 代表无网络  这里根据具体业务来自定义
        errorHandler(code: 9999, message: "网络似乎出现了问题", needShowFailAlert: needShowFailAlert, failure: failureCallback)
        return nil
    }
    return Provider1.request(MultiTarget(target)) { result in
        switch result {
        case let .success(response):
            do {
                let jsonData = try JSON(data: response.data)
                print("返回结果是：\(jsonData)")
                if !validateRepsonse(response: jsonData.dictionary, needShowFailAlert: needShowFailAlert, failure: failureCallback) { return }
                let respModel = ResponseModel()
                /// 这里的 -999的code码 需要根据具体业务来设置
                respModel.code = jsonData[codeKey].int ?? -999
                respModel.message = jsonData[messageKey].stringValue

                if respModel.code == successCode {
                    respModel.data = jsonData.rawString() ?? ""
                    
                    successCallback(respModel)
                } else {
                    errorHandler(code: respModel.code, message: respModel.message, needShowFailAlert: needShowFailAlert, failure: failureCallback)
                    return
                }

            } catch {
                // code = 1000000 代表JSON解析失败  这里根据具体业务来自定义
                errorHandler(code: 1000000, message: String(data: response.data, encoding: String.Encoding.utf8)!, needShowFailAlert: needShowFailAlert, failure: failureCallback)
            }
        case let .failure(error as NSError):
            errorHandler(code: error.code, message: "网络连接失败", needShowFailAlert: needShowFailAlert, failure: failureCallback)
        }
    }
    
}


/// 预判断后台返回的数据有效性 如通过Code码来确定数据完整性等  根据具体的业务情况来判断  有需要自己可以打开注释
/// - Parameters:
///   - response: 后台返回的数据
///   - showFailAlet: 是否显示失败的弹框
///   - failure: 失败的回调
/// - Returns: 数据是否有效
private func validateRepsonse(response: [String: JSON]?, needShowFailAlert: Bool, failure: RequestFailureCallback?) -> Bool {
    /**
    var errorMessage: String = ""
    if response != nil {
        if !response!.keys.contains(codeKey) {
            errorMessage = "返回值不匹配：缺少状态码"
        } else if response![codeKey]!.int == 500 {
            errorMessage = "服务器开小差了"
        }
    } else {
        errorMessage = "服务器数据开小差了"
    }

    if errorMessage.count > 0 {
        var code: Int = 999
        if let codeNum = response?[codeKey]?.int {
            code = codeNum
        }
        if let msg = response?[messageKey]?.stringValue {
            errorMessage = msg
        }
        errorHandler(code: code, message: errorMessage, showFailAlet: showFailAlet, failure: failure)
        return false
    }
     */

    return true
}

/// 错误处理
/// - Parameters:
///   - code: code码
///   - message: 错误消息
///   - needShowFailAlert: 是否显示网络请求失败的弹框
///   - failure: 网络请求失败的回调
private func errorHandler(code: Int, message: String, needShowFailAlert: Bool, failure: RequestFailureCallback?) {
    print("发生错误：\(code)--\(message)")
    let model = ResponseModel()
    model.code = code
    model.message = message
    if needShowFailAlert {
        // 弹框
        print("弹出错误信息弹框\(message)")
    }
    failure?(model)
}

private func judgeCondition(_ flag: String?) {
    switch flag {
    case "401", "402": break // token失效
    default:
        return
    }
}

class ResponseModel {
    var code: Int = -999
    var message: String = ""
    // 这里的data用String类型 保存response.data
    var data: String = ""
    /// 分页的游标 根据具体的业务选择是否添加这个属性
    var cursor: String = ""
}


/// 基于Alamofire,网络是否连接，，这个方法不建议放到这个类中,可以放在全局的工具类中判断网络链接情况
/// 用计算型属性是因为这样才会在获取isNetworkConnect时实时判断网络链接请求，如有更好的方法可以fork
extension UIDevice {
    static var isNetworkConnect: Bool {
        let network = NetworkReachabilityManager()
        return network?.isReachable ?? true // 无返回就默认网络已连接
    }
}


