//
//  HiAppInfoHelper.swift
//  OLMovie
//
//  Created by lx on 2018/11/16.
//  Copyright © 2018年 wgf. All rights reserved.
//

import UIKit

class HiAppInfoHelper: NSObject {
    let infoDictionary = Bundle.main.infoDictionary
    func appDisplayName() -> String {
        return (infoDictionary?["CFBundleDisplayName"] as AnyObject) as! String //程序名称
    }
    func minorVersion() -> String {
        return (infoDictionary?["CFBundleVersion"] as AnyObject) as! String //程序名称
    }
    func majorVersion() -> String {
        return (infoDictionary? ["CFBundleShortVersionString"] as AnyObject) as! String ////主程序版本号
    }
    func versionCheck(){
//        let majorVersion :AnyObject? = infoDictionary? ["CFBundleShortVersionString"] as AnyObject//主程序版本号
//        let minorVersion :AnyObject? = infoDictionary? ["CFBundleVersion"] as AnyObject//版本号（内部标示）
//        //设备信息
//        let iosVersion : NSString = UIDevice.current.systemVersion as NSString //ios版本
//        let identifierNumber = UIDevice.current.identifierForVendor //设备udid
//        let systemName = UIDevice.current.systemName //设备名称
//        let model = UIDevice.current.model //设备型号
//        let localizedModel = UIDevice.current.localizedModel //设备区域化型号如A1533
//        
//        
//        let appVersion = majorVersion as! String
    }
    
}
