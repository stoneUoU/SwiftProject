//
//  ConvertJsonStr.swift
//  OLMovie
//
//  Created by stone on 2019/9/30.
//  Copyright © 2019 Stone. All rights reserved.
//

import Foundation

class ConvertJsonStr: NSObject {
    
    @objc static func convertDictJsonStr(jsonStr:String) ->NSDictionary {
        
        let jsonData:Data = jsonStr.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
    
    @objc static func convertArrayJsonStr(jsonStr:String) ->NSArray {
        
        let jsonData:Data = jsonStr.data(using: .utf8)!
        
        let array = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if array != nil {
            return array as! NSArray
        }
        return NSArray()
    }
}
