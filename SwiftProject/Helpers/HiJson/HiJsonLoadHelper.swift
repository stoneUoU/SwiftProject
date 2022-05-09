//
//  HiJsonLoadHelper.swift
//  Hi-Helper-Module
//
//  Created by stone on 2022/5/9.
//

import Foundation


open class HiJsonLoadHelper:NSObject {
    
    @objc public static func fetchJson(named name: String,moduled module:String) ->Dictionary<AnyHashable, Any> {
        let path = URL(fileURLWithPath: Bundle.main.privateFrameworksPath ?? "").appendingPathComponent("\(module).framework").appendingPathComponent("\(module)".replacingOccurrences(of:"_", with: "-")+".bundle").path;
        let primaryBundle = Bundle(path: path);
        var error: Error? = nil
        let jsonPath = primaryBundle?.path(forResource: name, ofType: "json")
        let data = NSData(contentsOfFile: jsonPath ?? "")
        var jsonDictonary:Dictionary<AnyHashable, Any>?;
        do {
            if let data = data {
                jsonDictonary = try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers) as? [AnyHashable : Any]
            }
        } catch {
        }
        if error != nil {
            print("read host json failed !!!!!!!!!")
        }
        return jsonDictonary as! Dictionary<AnyHashable, Any>;
    }
}
