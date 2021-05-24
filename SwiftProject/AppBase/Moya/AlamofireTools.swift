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
enum PSHTTPMethod{
    case GET
    case POST
}
struct AlamofireAppManager {
    static let shared: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 5.0
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        return sessionManager
    }()
}
class NetworkTools {
//    func requestData(_ type : PSHTTPMethod, options : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
//        // 1.获取类型
//        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
//        let headers: HTTPHeaders = [
//            "Content-Type": "application/json"
//        ]
//        AlamofireAppManager.shared.request(APP_UPDATE+options, method: method, parameters: parameters,encoding: JSONEncoding.default, headers:headers).responseJSON{ response in
//            switch response.result {
//            case .failure:
//                let result = [String:Bool]()
//                finishedCallback(result)
//            case .success:
//                // 3.获取结果
//                guard let result = response.result.value else {
//                    return
//                }
//                // 4.将结果回调出去
//                finishedCallback(result)
//            }
//        }
//    }
}
let AlamofireStart=NetworkTools()   //异步请求对象
