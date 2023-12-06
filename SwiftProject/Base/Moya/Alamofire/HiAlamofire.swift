//
//  AlamofireTools.swift
//  OLMovie
//
//  Created by stone on 2019/9/1.
//  Copyright © 2019 Stone. All rights reserved.
//

import Alamofire
import SwiftyJSON
// Swift的枚举支持任意数据类型,不需要,分隔

enum HiHTTPMethod {
    case GET
    case POST
}

//struct AlamofireAppManager {
//    static let shared: SessionManager = {
//        let configuration = URLSessionConfiguration.default
//        configuration.timeoutIntervalForRequest = 5.0
//        let sessionManager = Alamofire.SessionManager(configuration: configuration)
//        return sessionManager
//    }()
//}

class HiAlamofire {
    class func requestData<T: Decodable>(_ url:String, _ requestType : HiHTTPMethod, parameters : [String : Any]? = nil, of type: T.Type = T.self, finishedCallback :  @escaping (_ result : Any) -> ()) {
        // 1.获取类型
        let method = requestType == .GET ? HTTPMethod.get : HTTPMethod.post
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        AF.request(url, method: method, parameters: parameters, headers:headers).responseDecodable(of: type){ response in
            switch response.result {
            case .failure:
                let result = [String:Bool]()
                finishedCallback(result)
            case .success:
                // 3.获取结果
                guard let result = response.data else {
                    return
                }
                // 4.将结果回调出去
                finishedCallback(result)
            }
        }
    }
    
    class func request<T: Decodable>(_ url: String, method: HTTPMethod = HTTPMethod.get, parameters: Parameters? = nil, of type: T.Type = T.self ,finish: @escaping (Any)->(), failure: @escaping (Error?)->()) {
        AF.request(url, method: method, parameters: parameters).responseDecodable(of: type){ response in
            if (response.error != nil) {
                failure(response.error!)
            } else {
                guard let data = response.value else {
                    return
                }
                finish(data)
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
//    class func requestString(_ url: String, method: HTTPMethod = HTTPMethod.get, parameters: Parameters? = nil, encoding:ParameterEncoding = URLEncoding.default,finish: @escaping (Any)->(), failure: @escaping (Error?)->()) {
//        let manager = SessionManager.default
//        manager.delegate.sessionDidReceiveChallenge = {
//            session,challenge in
//            return    (URLSession.AuthChallengeDisposition.useCredential,URLCredential(trust:challenge.protectionSpace.serverTrust!))
//        }
//
//        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding).responseString(queue: DispatchQueue.main, encoding: .utf8) { (response) in
//            if response.result.isSuccess {
//                if let value = response.result.value {
//                    finish(value)
//                }else {
//                    failure(response.error)
//                }
//            }else {
//                failure(response.error)
//            }
//        }
//    }
    
    /// 请求json格式数据, 直接使用, 已完成序列化
    ///
    /// - Parameters:
    ///   - url: 请求url
    ///   - method: 请求方式, get post, 默认get
    ///   - parameters: 请求参数, 默认nil
    ///   - encoding: 数据编码, 请求参数编码, 默认URLEncoding
    ///   - finish: 成功回调
    ///   - failure: 失败回调
    class func requestJSON<T: Decodable>(_ url: String, method: HTTPMethod = HTTPMethod.get, parameters: Parameters? = nil, of type: T.Type = T.self, finish: @escaping (Any)->(), failure: @escaping (Error?)->()) {
        AF.request(url, method: method, parameters: parameters).responseDecodable(of: type){ response in
            if (response.error != nil) {
                failure(response.error!)
            } else {
                guard let data = response.value else {
                    return
                }
                finish(data)
            }
        }
    }
}
