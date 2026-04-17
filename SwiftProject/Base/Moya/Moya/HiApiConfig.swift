//
//  HiApiConfig.swift
//  OLMovie
//
//  Created by stone on 2019/8/30.
//  Copyright © 2019 Stone. All rights reserved.
//

import Moya
//请求分类
public enum HiApiConfig {
    
    case fetchGetMethod([String : Any])
    
    case fetchPostMethod([String : Any])
    
    //获取unitCfg接口数据：
    case unitCfg([String : Any])
    
    case isNeedEquipLoginApi([String : Any])
}

//请求配置
extension HiApiConfig:HiApiConfigTargetType {
    //服务器地址
    public var baseURL: URL {
        switch self {
            case .unitCfg(_):
                return URL(string: HiHSARequestSwiftURL)!
            case .isNeedEquipLoginApi(_):
                return URL(string: HiShanXiRequestSwiftURL)!
            default:
                return URL(string: HiRequestSwiftURL)!
        }
    }
    //各个请求的具体路径
    public var path: String {
        switch self {
        case .fetchGetMethod(_):
            return ""
        case .fetchPostMethod(_):
            return ""
        case .unitCfg(_):
            return "/base/api/unitCfg"
        case .isNeedEquipLoginApi(_):
            return "/app/login/forward/acct/isNeedEquipLogin"
        }
    }
    public var method: Moya.Method {
        switch self {
        case .fetchGetMethod(_):
            return .get
        default:
            return .post
        }
    }
        
    public var task: Task {
        switch self {
        //get 走这
        case .fetchGetMethod(let paras):
            var params: [String: Any] = [:]
            params = paras
            return .requestParameters(parameters: params,
                                      encoding: URLEncoding.default)
        //post 走这
        case .fetchPostMethod(let  paras):
            var params: [String: Any] = [:]
            params = paras
            return .requestParameters(parameters: params,
                                      encoding: JSONEncoding.default)
        case .unitCfg(let paras):
            return .requestParameters(parameters: HiEncrypt.encrypt(params: paras),
                                      encoding: JSONEncoding.default)
        case .isNeedEquipLoginApi(let paras):
            return .requestParameters(parameters: HiEncrypt.encrypt(params:paras),
                                      encoding: JSONEncoding.default)
        //没有请求参数走这
        default:
            return .requestPlain
        }
    }
    //是否执行Alamofire验证
    public var validate: Bool {
        return false
    }
    //这个就是做单元测试模拟的数据，只会在单元测试文件中有作用
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    //请求头
    public var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "appversion": "2.1.0",
            "appid": "com.hsa.app.shanxi",
            "channel": "app",
            "operateSystem": "iOS",
            "operateSystemVersion": "26.3.1",
            "encryptFlag":"true"
        ]
    }
    
    //是否需要Loading
    public var needLoading: Bool {
        switch self {
        case .fetchGetMethod(_),.isNeedEquipLoginApi(_):
            return true
        default:
            return false
        }
    }
    
    //是否需要加密:
    public var needEncypted: Bool {
        switch self {
        case .fetchGetMethod(_):
            return true
        default:
            return false
        }
    }
    
    //是否需要打印请求体:
    public var needLogRequest: Bool {
        switch self {
        case .fetchGetMethod(_),.isNeedEquipLoginApi(_):
            return true
        default:
            return false
        }
    }
    
    //是否需要打印响应体:
    public var needLogResponse: Bool {
        switch self {
        case .fetchGetMethod(_),.isNeedEquipLoginApi(_):
            return false
        default:
            return false
        }
    }
    
}
