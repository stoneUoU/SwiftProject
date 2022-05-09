//
//  HiJsonStrHelper.swift
//  OLMovie
//
//  Created by stone on 2019/9/30.
//  Copyright © 2019 Stone. All rights reserved.
//

import Foundation

public class HiJsonStrHelper: NSObject {
    
    @objc public static func convertDictToJsonStr(dict:[AnyHashable:Any]) -> String {
        var result:String = ""
        do {
            //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.init(rawValue: 0))
            if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
                result = JSONString
            }
        } catch {
            result = ""
        }
        return result
    }
    
    @objc public static func convertJsonStrToDict(jsonStr:String) ->NSDictionary {
        
        let jsonData:Data = jsonStr.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
    
    @objc static func convertJsonStrToArray(jsonStr:String) ->NSArray {
        
        let jsonData:Data = jsonStr.data(using: .utf8)!
        
        let array = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if array != nil {
            return array as! NSArray
        }
        return NSArray()
    }
}
