
import UIKit
import Alamofire
import SwiftyJSON

class HttpTool: NSObject {

    @available(iOS, introduced: 2.0, deprecated: 8.0, message: "request方法已过期, 请使用requestString 或者 requestJson")
    class func request(_ url: String, method: HTTPMethod = HTTPMethod.get, parameters: Parameters? = nil, encoding:ParameterEncoding = URLEncoding.default,finish: @escaping (Any)->(), failure: @escaping (Error?)->()) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding).responseJSON { (response) in
            if response.result.isSuccess {
                if let value = response.result.value {
                    finish(value)
                }else {
                    failure(response.error)
                }
            }else {
                failure(response.error)
            }
        }
    }

    /// 请求字符串类型数据 如html, xml等, 如果请求的是json则需要自行序列化
    ///
    /// - Parameters:
    ///   - url: 请求url
    ///   - method: 请求方式, get post, 默认get
    ///   - parameters: 请求参数, 默认nil
    ///   - encoding: 请求参数编码, 默认 URLEncoding
    ///   - finish: 成功回调
    ///   - failure: 失败回调
    class func requestString(_ url: String, method: HTTPMethod = HTTPMethod.get, parameters: Parameters? = nil, encoding:ParameterEncoding = URLEncoding.default,finish: @escaping (Any)->(), failure: @escaping (Error?)->()) {
        let manager = SessionManager.default
        manager.delegate.sessionDidReceiveChallenge = {
            session,challenge in
            return    (URLSession.AuthChallengeDisposition.useCredential,URLCredential(trust:challenge.protectionSpace.serverTrust!))
        }

        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding).responseString(queue: DispatchQueue.main, encoding: .utf8) { (response) in
            if response.result.isSuccess {
                if let value = response.result.value {
                    finish(value)
                }else {
                    failure(response.error)
                }
            }else {
                failure(response.error)
            }
        }
    }
    
    /// 请求json格式数据, 直接使用, 已完成序列化
    ///
    /// - Parameters:
    ///   - url: 请求url
    ///   - method: 请求方式, get post, 默认get
    ///   - parameters: 请求参数, 默认nil
    ///   - encoding: 数据编码, 请求参数编码, 默认URLEncoding
    ///   - finish: 成功回调
    ///   - failure: 失败回调
    class func requestJSON(_ url: String, method: HTTPMethod = HTTPMethod.get, parameters: Parameters? = nil, encoding:ParameterEncoding = URLEncoding.default,finish: @escaping (Any)->(), failure: @escaping (Error?)->()) {
//        GFLog("___________\(parameters)");
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding)
            .responseJSON { (response) in
            if response.result.isSuccess {
                if let value = response.result.value {
                    finish(value)
                }else {
                    failure(response.error)
                }
            }else {
                failure(response.error)
            }
        }
    }
}
