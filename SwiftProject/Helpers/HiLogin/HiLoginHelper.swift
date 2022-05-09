//
//  HiLoginHelper.swift
//  Hi-Helper-Module
//
//  Created by stone on 2022/5/5.
//

import UIKit

open class HiLoginHelper:NSObject {
    
    @objc static var shared: HiLoginHelper {
        struct Static {
            static let sharedInstance = HiLoginHelper()
        }
        return Static.sharedInstance;
    }
    
    @objc func toExcute() {
        
    }
}


